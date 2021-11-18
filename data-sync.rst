Data Syncing
============
Teak can provide raw row level data in CSVs in an S3 bucket in near real time for you to consume into your own analytics pipeline. For more information please `contact support <mailto:team@teak.io>`_.

Row Format
----------

All events provided by the data sync have the following row format, represented as a SQL CREATE TABLE statement::

   CREATE TABLE teak_events(
     id BIGINT NOT NULL,
     event_type VARCHAR(255) NOT NULL,
     happened_at DATETIME NOT NULL,
     teak_app_id VARCHAR(255) NOT NULL,
     platform VARCHAR(255) NOT NULL,
     player_id VARCHAR(255),
     schedule_id INT,
     creative_id INT,
     schedule_name VARCHAR(255),
     creative_name VARCHAR(255),
     platform_id VARCHAR(255),
     audience_name VARCHAR(255),
     schedule_type VARCHAR(255)
   )

id
^^^
Each event is issued a unique 64 bit identifier. This identifier may be used to deduplicate and correlate events.

event_type
^^^^^^^^^^
event_type indicates what type of event the row represents. Event types will be discussed later in this document.

happened_at
^^^^^^^^^^^
happened_at is an ISO8601 timestamp in UTC specifying when the event occurred.

teak_app_id
^^^^^^^^^^^
teak_app_id is the App ID of the corresponding game in Teak

platform
^^^^^^^^
platform indicates the platform the event occurred on. At time of writing it may be one of "fb", "android", "ios", or "UNKNOWN". Note that most email events will have a platform of "UNKNOWN".

player_id
^^^^^^^^^
player_id is the game assigned player id of the player who was involved with this event. Teak makes a best effort to provide player_id for all events, however some purchase events may lack a player_id.

schedule_id
^^^^^^^^^^^
If the event involved a notification or email, schedule_id will be set to an internal numeric identifier for the respective Schedule in the Teak dashboard.

creative_id
^^^^^^^^^^^
If the event involved a notification, email, or link, creative_id will be set to an internal numeric identifier for the respective Message or Link in the Teak dashboard. Note that Messages and Links share an id space -- you will not have a situation where a Message and Link have the same creative_id.

schedule_name
^^^^^^^^^^^^^
If the event involved a Schedule, schedule_name will be set to the name of the Schedule on the Teak dashboard at the time the event was processed.

creative_name
^^^^^^^^^^^^^
If the event involved a Message or Link, creative_name will be set to the name of the Message or Link on the Teak dashboard at the time the event was processed.

platform_id
^^^^^^^^^^^
platform_id has different meanings depending on the event type.

:notification_send: platform_id will be the base10 string representation of id
:notification_received: platform_id will be the base10 string representation of the id of the corresponding notification_send event
:notification_expanded: platform_id will be the base10 string representation of the id of the corresponding notification_send event
:notification_click: platform_id will be the base10 string representation of the id of the corresponding notification_send event
:click: platform_id will be the base10 string representation of id
:launch: If the launch is attributed to a notification_click or click, platform_id will be the base10 string representation of the corresponding notification_click or click event
:email_block: platform_id will be the base10 string representation of the id of the corresponding notification_send event
:email_bounce: platform_id will be the base10 string representation of the id of the corresponding notification_send event
:email_spam: platform_id will be the base10 string representation of the id of the corresponding notification_send event
:email_unsubscribe: platform_id will be the base10 string representation of the id of the corresponding notification_send event
:null_send: platform_id will be the base10 string representation of id
:purchase: platform_id will be set to the platform's id for the purchase. On Android this will be the order id, on iOS this will be the transaction id from the receipt, on Facebook this will be the id of the corresponding purchase object.

audience_id
^^^^^^^^^^^
If the event involved a notification or email sent to a specific audience, this will be the name of the audience in the Teak dashboard at the time the event was processed.

schedule_type
^^^^^^^^^^^^^
If the event involved a Schedule, this will be set to the targeting type of the schedule, which will be one of 'now', 'later', 'triggered', or 'local'


Event Types
-----------

Teak can provide the following events as part of a data sync

notification_send
^^^^^^^^^^^^^^^^^
A notification_send event is generated when Teak makes a request to the underlying notification provider to send a notification (FB, APNS, FCM, ADM, or your email service provider), and the provider indicates the send was successful.

notification_received
^^^^^^^^^^^^^^^^^^^^^
A notification_received event is generated when Teak is able to confirm that a notification was received by the player. On iOS and Android this will only occur if notifications have not been blocked by the player and their device is powered on and has an internet connection. For email this will occur when the receiving mailserver confirms receipt. Facebook A2U does not support notification receipts and will not report notification_received events.

notification_expanded
^^^^^^^^^^^^^^^^^^^^^
A notification_expanded event is generated when a player "expands" or otherwise takes a proactive action to view a notification. This event is only generated for iOS rich push notifications when the player expands the notification to view the associated image or video, and on email when a player opens an email.

notification_click
^^^^^^^^^^^^^^^^^^
A notification_click event is generated when a player clicks on a notification or email and successfully enters the game as a result. The player must get far enough into game loading for Teak to have a player id in order for this event to be tracked.

click
^^^^^
A click event is generated when a player clicks on a Link and successfully enters the game as a result. The player must get far enough into game loading for Teak to have a player id in order for this event to be tracked.

launch
^^^^^^
A launch event is generated when a player gets far enough into game loading for Teak to have a player id.

email_block
^^^^^^^^^^^
An email_block event is generated when a mailserver informs Teak that an email could temporarily not be delivered due to an issue with the player's inbox (e.g. their inbox is full).

email_bounce
^^^^^^^^^^^^
An email_bounce event is generated when a mailserver informs Teak that an email permanently could not be delivered due to an issue (e.g. the player's email address is invalid).

email_unsubscribe
^^^^^^^^^^^^^^^^^
An email_unsubscribe event is generated when a player unsubscribes from an email either by using the quick list unsubscribe feature or by clicking the unsubscribe link in the email and changing their subscription status.

email_spam
^^^^^^^^^^
An email_spam event is generated when a player marks an email as spam. Note that email_spam is not generated if the player's email provider's spam filter marks the email as spam.

null_send
^^^^^^^^^
A null_send event is generated when Teak is performing a warmup of cold email IPs with no warm email IPs to use for excess sends. Instead sends beyond the limits of the warmup schedule will be tracked as null_send and not actually sent.

purchase
^^^^^^^^
A purchase event is generated when Teak is informed of and confirms the validity of an in-app purchase using real currency.
