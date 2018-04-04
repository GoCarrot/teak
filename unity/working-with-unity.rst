Working with Notifications, Rewards and Deep Links inside Unity
===============================================================
.. highlight:: csharp

Requesting Push Notification Permissions
----------------------------------------
In order to use push notifications on iOS, you will need to request permissions.

If you are using Unity 5::

    UnityEngine.iOS.NotificationServices.RegisterForNotifications(UnityEngine.iOS.NotificationType.Alert |
        UnityEngine.iOS.NotificationType.Badge |  UnityEngine.iOS.NotificationType.Sound);

If you are using Unity 4::

    NotificationServices.RegisterForRemoteNotificationTypes(RemoteNotificationType.Alert |
        RemoteNotificationType.Badge |  RemoteNotificationType.Sound);

.. note:: We suggest that you don't simply ask for push permissions when the app starts. We'll be happy to talk with you to figure out what works best for your title.

Push Notifications and Local Notifications
------------------------------------------
Whenever your game is launched via a push notification, or local notification Teak will let you know by sending out an event to all listeners.

You can listen for that event during by first writing a listener function, for example::

    void MyOnLaunchedFromNotificationListener(TeakNotification notification)
    {
        Debug.Log("OnLaunchedFromNotification: " + notification.CreativeId + " - " + notification.ScheduleId + " Incentivized? " + notification.Incentivized);
    }

And then adding it to the ``Teak.Instance.OnLaunchedFromNotification`` event during ``Start()`` in any ``MonoBehaviour``::

    void Start()
    {
        Teak.Instance.OnLaunchedFromNotification += MyOnLaunchedFromNotificationListener;
    }

Rewards
-------
Whenever your game should grant a reward to a user Teak will let you know by sending out an event to all listeners.

You can listen for that event during by first writing a listener function, for example::

    void MyRewardListener(TeakReward reward)
    {
        switch (reward.Status) {
            case TeakReward.RewardStatus.GrantReward: {
                // The user has been issued this reward by Teak
                foreach(KeyValuePair<string, object> entry in reward.Reward)
                {
                    Debug.Log("[Teak Unity Cleanroom] OnReward -- Give the user " + entry.Value + " instances of " + entry.Key);
                }
            }
            break;

            case TeakReward.RewardStatus.SelfClick: {
                // The user has attempted to claim a reward from their own social post
            }
            break;

            case TeakReward.RewardStatus.AlreadyClicked: {
                // The user has already been issued this reward
            }
            break;

            case TeakReward.RewardStatus.TooManyClicks: {
                // The reward has already been claimed its maximum number of times globally
            }
            break;

            case TeakReward.RewardStatus.ExceedMaxClicksForDay: {
                // The user has already claimed their maximum number of rewards of this type for the day
            }
            break;

            case TeakReward.RewardStatus.Expired: {
                // This reward has expired and is no longer valid
            }
            break;

            case TeakReward.RewardStatus.InvalidPost: {
                //Teak does not recognize this reward id
            }
            break;
        }
    }

And then adding it to the ``Teak.Instance.OnReward`` event during ``Start()`` in any ``MonoBehaviour``::

    void Start()
    {
        Teak.Instance.OnReward += MyRewardListener;
    }

Working with Local Notifications
--------------------------------
You can use Teak to schedule notifications for the future.

.. note:: You get the full benefit of Teak's analytics, A/B testing, and Content Management System.

.. note:: All local notification related methods are coroutines. You may need to wrap calls to them in StartCoroutine()

Scheduling a Local Notification
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
To schedule a notification from your game, simply use::

    IEnumerator TeakNotification.ScheduleNotification(string creativeId, string defaultMessage, long delayInSeconds, System.Action<string, string> callback)

Parameters
    ``creativeId`` - A value used to identify the message creative in the Teak CMS e.g. "daily_bonus"

    ``defaultMessage`` - The text to use in the notification if there are no modifications in the Teak CMS.

    ``delayInSeconds`` - The number of seconds from the current time before the notification should be sent.

    ``callback`` - The callback to be called after the notification is scheduled

Callback
    The callback takes two string parameters. The first parameter contains any data from the call, and the second indicates the status of the call. The status can be one of
        ``ok`` - The notification was successfully scheduled

        ``invalid_device`` - The current device has not been registered with Teak

        ``unconfigured_key`` - The current device cannot display notifications

        ``error.internal`` - An unknown error occurred and the call should be retried

    If the call succeeded, the data in the first string will be an opaque identifer that can be passed to ``CancelScheduledNotification`` to cancel the notification.

Canceling a Local Notification
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
To cancel a previously scheduled local notification, use::

    IEnumerator TeakNotification.ScheduleNotification(string scheduledId, System.Action<string, string> callback)

Parameters
    ``scheduleId`` - The id received from the ``ScheduleNotification()`` callback

Callback
    The callback takes two string parameters. The first parameter contains any data from the call, and the second indicates the status of the call. The status can be one of
        ``ok`` - The notification was successfully cancelled

        ``error.internal`` - An unknown error occurred and the call should be retried

    If the call succeeded, the data in the first string will the ``scheduleId`` that was canceled

Canceling all Local Notifications
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
To cancel all previously scheduled local notifications, use::

    IEnumerator TeaKNotification.CancelAllScheduledNotifications(System.Action<string, string> callback)

Callback
    The callback takes two string parameters. The first parameter contains any data from the call, and the second indicates the status of the call. The status can be one of
        ``ok`` The request was succesfully processed

        ``invalid_device`` The current device has not been registered with Teak. This is likely caused by ```identifyUser()``` not being called

        ``error.internal`` An unexpected error occurred and the request should be retried

    If status is ``ok`` then the first string will be a JSON encoded array. Each entry in the array will be a
    dictionary with ``scheduleId`` and ``creativeId`` entries. ``scheduleId`` is the id originally received from the
    ``TeakNotification.ScheduleNotification`` call. ``creativeId`` is the ``creativeId`` originally passed to
    ``TeakNotification.ScheduleNotification()``

.. note:: This call is processed asynchronously. If you immediately call ``TeakNotification.ScheduleNotification()`` after calling ``TeakNotification.CancelAllScheduledNotifications()`` it is possible for your newly scheduled notification to also be canceled. We recommend waiting until the callback has fired before scheduling any new notifications.

Determining if User Has Disabled Push Notifications
---------------------------------------------------
You can use Teak to determine if a user has disabled push notifications for your app.

If notifications are disabled, you can prompt them to re-enable them on the settings page for the app, and use Teak to go directly the settings for your app.

Are Notifications Enabled?
^^^^^^^^^^^^^^^^^^^^^^^^^^^
To determine if notifications are enabled, use::

    bool AreNotificationsEnabled()

This function will return ``false`` if notifications are disabled, or ``true`` if notifications are enabled, or Teak could not determine the status.

Example::

    if (!Teak.Instance.AreNotificationsEnabled()) {
        // Show a button that will let users open the settings
    }

Opening the Settings for Your App
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
If you want to show the settings for your app, use::

    bool OpenSettingsAppToThisAppsSettings()

This function will return ``false`` if Teak was not able to open the settings, ``true`` otherwise.

Example::

    // ...
    // When a user presses a button indicating they want to change their notification settings
    Teak.Instance.OpenSettingsAppToThisAppsSettings()

Deep Links
----------

Adding deep link targets in your game is easy with Teak.

You can add routes during the ``Awake()`` function of any ``MonoBehaviour``. For example::

    void Awake()
    {
        Teak.Instance.RegisterRoute("/store/:sku", "Store", "Open the store to an SKU", (Dictionary<string, object> parameters) => {
            // Any URL query parameters, or path parameters will be contained in the dictionary
            Debug.Log("Open the store to this sku - " + parameters["sku"]);
        });
    }

.. The route system that Teak uses is very flexible, let's look at a slightly more complicated example.

.. What if we wanted to make a deep link which opened the game to a specific slot machine.
