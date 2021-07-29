Notification Metrics
====================
These are the metrics Teak tracks for notifications with a description of what causes Teak to track each given metric.

Schedules
---------

Sends
^^^^^
A send is tracked when the underlying messaging service indicates that it will attempt to deliver a notification to a player.

Clicks
^^^^^^
A click is tracked when a player enters the game through a notification. Note that the game must get through complete Teak SDK initialization before a click event will be tracked.

CTR
^^^
Schedule CTR is clicks / sends as a percentage.

Returning Users
^^^^^^^^^^^^^^^
Returning Users is the count of distinct players each day who clicked on a notification. Note that if you are looking at a time period of, e.g. Jul 16, 2021 - Jul 29, 2021, and the same player clicked on the same notification on Jul 16 and Jul 17, they will be counted as two returning users for the overall metric.

Return Value
^^^^^^^^^^^^
Return value is the sum of USD revenue from in-app purchases made during sessions which started because of a click on the notification. If a player exits the game for longer than two minutes after a notification click or force closes the game and then relaunches it before making a purchase, that purchase will be considered part of a new session and will not be counted as Return Value.

Return Spenders
^^^^^^^^^^^^^^^
Return Spenders is the count of distinct players each day who made an in-app purchase during a session started from the notification. Note that if you are looking at a time period of, e.g. Jul 16, 2021 - Jul 29, 2021, and the same player clicked on the same notification on Jul 16 and Jul 17 and made an in-app purchase in both sessions on both days, they will be counted as two returning spenders for the overall metric.

Return Value per Spender
^^^^^^^^^^^^^^^^^^^^^^^^
Return Value per Spender is Return Value / Return Spenders.

Facebook A2U
------------

Sends
^^^^^
A send is tracked when Facebook indicates that it will attempt to deliver a notification to a player.

Clicks
^^^^^^
A click is tracked when a player enters the game through a Facebook A2U notification. Note that the game must get through complete Teak SDK initialization before a click event will be tracked.

CTR
^^^
Facebook A2U CTR is clicks / sends as a percentage.

Returning Users
^^^^^^^^^^^^^^^
Returning Users is the count of distinct players each day who clicked on a notification. Note that if you are looking at a time period of, e.g. Jul 16, 2021 - Jul 29, 2021, and the same player clicked on the same notification on Jul 16 and Jul 17, they will be counted as two returning users for the overall metric.

Return Value
^^^^^^^^^^^^
Return value is the sum of USD revenue from in-app purchases made during sessions which started because of a click on the notification. If a player exits the game for longer than two minutes after a notification click or force closes the game and then relaunches it before making a purchase, that purchase will be considered part of a new session and will not be counted as Return Value.

Return Spenders
^^^^^^^^^^^^^^^
Return Spenders is the count of distinct players each day who made an in-app purchase during a session started from the notification. Note that if you are looking at a time period of, e.g. Jul 16, 2021 - Jul 29, 2021, and the same player clicked on the same notification on Jul 16 and Jul 17 and made an in-app purchase in both sessions on both days, they will be counted as two returning spenders for the overall metric.

Impact
^^^^^^
Impact is Returning Users for the notification divided by the sum of all sends for all Facebook A2U notifications.

iOS Push
--------

Sends
^^^^^
A send is tracked when the Apple Push Notification service indicates that it will attempt to deliver a notification to a player.

Confirmed Receipts
^^^^^^^^^^^^^^^^^^
A Confirmed Receipt is tracked when a notification is received and displayed by a device.

Expanded View Imp.
^^^^^^^^^^^^^^^^^^
An Expanded View Impression is tracked when a notification with an expanded view is expanded by the player by force pressing or press-and-holding on the notification.

Clicks
^^^^^^
A click is tracked when a player enters the game through an iOS Push notification. Note that the game must get through complete Teak SDK initialization before a click event will be tracked.

CTR
^^^
iOS Push CTR is clicks / sends as a percentage.

Con. Receipt CTR
^^^^^^^^^^^^^^^^
Confirmed Receipt CTR is clicks / confirmed receipts as a percentage.

Returning Users
^^^^^^^^^^^^^^^
Returning Users is the count of distinct players each day who clicked on a notification. Note that if you are looking at a time period of, e.g. Jul 16, 2021 - Jul 29, 2021, and the same player clicked on the same notification on Jul 16 and Jul 17, they will be counted as two returning users for the overall metric.

Return Rate
^^^^^^^^^^^
Return Rate is returning users / confirmed receipts.

Return Value
^^^^^^^^^^^^
Return value is the sum of USD revenue from in-app purchases made during sessions which started because of a click on the notification. If a player exits the game for longer than two minutes after a notification click or force closes the game and then relaunches it before making a purchase, that purchase will be considered part of a new session and will not be counted as Return Value.

Return Spenders
^^^^^^^^^^^^^^^
Return Spenders is the count of distinct players each day who made an in-app purchase during a session started from the notification. Note that if you are looking at a time period of, e.g. Jul 16, 2021 - Jul 29, 2021, and the same player clicked on the same notification on Jul 16 and Jul 17 and made an in-app purchase in both sessions on both days, they will be counted as two returning spenders for the overall metric.

Impact
^^^^^^
Impact is Returning Users for the notification divided by the sum of all sends for all iOS Push notifications.

Android Push
------------

Sends
^^^^^
A send is tracked when Firebase Cloud Messaging indicates that it will attempt to deliver a notification to a player.

Confirmed Receipts
^^^^^^^^^^^^^^^^^^
A Confirmed Receipt is tracked when a notification is received and displayed by a device.

Clicks
^^^^^^
A click is tracked when a player enters the game through an iOS Push notification. Note that the game must get through complete Teak SDK initialization before a click event will be tracked.

CTR
^^^
iOS Push CTR is clicks / sends as a percentage.

Con. Receipt CTR
^^^^^^^^^^^^^^^^
Confirmed Receipt CTR is clicks / confirmed receipts as a percentage.

Returning Users
^^^^^^^^^^^^^^^
Returning Users is the count of distinct players each day who clicked on a notification. Note that if you are looking at a time period of, e.g. Jul 16, 2021 - Jul 29, 2021, and the same player clicked on the same notification on Jul 16 and Jul 17, they will be counted as two returning users for the overall metric.

Return Rate
^^^^^^^^^^^
Return Rate is returning users / confirmed receipts.

Return Value
^^^^^^^^^^^^
Return value is the sum of USD revenue from in-app purchases made during sessions which started because of a click on the notification. If a player exits the game for longer than two minutes after a notification click or force closes the game and then relaunches it before making a purchase, that purchase will be considered part of a new session and will not be counted as Return Value.

Return Spenders
^^^^^^^^^^^^^^^
Return Spenders is the count of distinct players each day who made an in-app purchase during a session started from the notification. Note that if you are looking at a time period of, e.g. Jul 16, 2021 - Jul 29, 2021, and the same player clicked on the same notification on Jul 16 and Jul 17 and made an in-app purchase in both sessions on both days, they will be counted as two returning spenders for the overall metric.

Impact
^^^^^^
Impact is Returning Users for the notification divided by the sum of all sends for all Android Push notifications.

Email
-----

Sends
^^^^^
A send is tracked when the configured Email Service Provider indicates that it will attempt to deliver a notification to a player.

Confirmed Receipts
^^^^^^^^^^^^^^^^^^
A Confirmed Receipt is tracked when a receiving mail server confirms receipt of an email.

Opens
^^^^^
An open is tracked when a player opens and views an email, with image loading enabled.

Unique Opens
^^^^^^^^^^^^
Unique Opens is the count of distinct players each day who opened an email. Note that if you are looking at a time period of, e.g. Jul 16, 2021 - Jul 29, 2021, and the same player opened the same email on Jul 16 and Jul 17, they will be counted as two unique opens for the overall metric.

Open Rate
^^^^^^^^^
Open Rate is opens / sends as a percentage.

Clicks
^^^^^^
A click is tracked when a player enters the game through a link on an email. Note that the game must get through complete Teak SDK initialization before a click event will be tracked. Note that email links which do not launch the game will not be tracked.

CTR
^^^
Email CTR is clicks / sends as a percentage.

Click to Open Rate
^^^^^^^^^^^^^^^^^^
Click to Open Rate is returning users / unique opens as a percentage.

Con. Receipt CTR
^^^^^^^^^^^^^^^^
Confirmed Receipt CTR is clicks / confirmed receipts as a percentage.

Returning Users
^^^^^^^^^^^^^^^
Returning Users is the count of distinct players each day who clicked on an email. Note that if you are looking at a time period of, e.g. Jul 16, 2021 - Jul 29, 2021, and the same player clicked on the same email on Jul 16 and Jul 17, they will be counted as two returning users for the overall metric.

Return Rate
^^^^^^^^^^^
Return Rate is returning users / confirmed receipts.

Return Value
^^^^^^^^^^^^
Return value is the sum of USD revenue from in-app purchases made during sessions which started because of a click on the email. If a player exits the game for longer than two minutes after an email click or force closes the game and then relaunches it before making a purchase, that purchase will be considered part of a new session and will not be counted as Return Value.

Return Spenders
^^^^^^^^^^^^^^^
Return Spenders is the count of distinct players each day who made an in-app purchase during a session started from the notification. Note that if you are looking at a time period of, e.g. Jul 16, 2021 - Jul 29, 2021, and the same player clicked on the same notification on Jul 16 and Jul 17 and made an in-app purchase in both sessions on both days, they will be counted as two returning spenders for the overall metric.

Impact
^^^^^^
Impact is Returning Users for the notification divided by the sum of all sends for all iOS Push notifications.

Bounces
^^^^^^^
A bounce is tracked when email delivery fails for a permanent reason, e.g. the email address is invalid or has been deleted.

Bounce Rate
^^^^^^^^^^^
Bounce Rate is bounces / sends as a percentage.

Blocks
^^^^^^
A block is tracked when email delivery fails for a temporary reason, e.g. the player's email inbox is full.

Unsubscribes
^^^^^^^^^^^^
An unsubscribe is tracked when a player uses the unsubscribe link in the email to unsubscribe from future deliveries.

Spam Reports
^^^^^^^^^^^^
A spam report is tracked when a player marks a received email as spam. Spam reports are _not_ tracked when the receiving mail server's spam filter marks an email as spam.

Unwanted Rate
^^^^^^^^^^^^^
Unwanted rate is (unsubscribes + spam reports) / sends as a percentage.

Suppressed for Cold IP
^^^^^^^^^^^^^^^^^^^^^^
Suppressed for Cold IP is the count of emails which would have been sent but were instead suppressed due to ongoing IP warmup.
