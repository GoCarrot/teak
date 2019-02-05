.. _schedule:

Schedules
=========

Overview
--------

A Schedule defines what Message should be sent to which Audience and at what time, or based on certain triggers. Teak will never send a notification unless directed to by a Schedule.

Creating
--------

To create a Schedule, click 'New Schedule' from the Schedules tab of the Notification section.

.. warning:: TODO: Screenshot of notification section on schedule tab, with box around 'Notifications' and 'Schedule', and arrow pointing to 'New Schedule'.

A Schedule only ties together a Message and an Audience. If you don't have any Messages or Audiences, you will have to create new ones for use. You can do so while creating a new Schedule by selecting the options from the appropriate dropdowns

.. warning:: TODO: Screenshot of 'Create new Message' option in dropdown.

.. warning:: TODO: Crosslink to documentation on creating audience and message.

Reference
---------

Name
  How the Schedule will be identified in the list of schedules and elsewhere in Teak. This may be up to 255 characters with no other limits (e.g. spaces, non-English characters, and even emoji are usable in names).

Who would you like to send this notification to?
  This is the Audience that will receive the Message, or be used to trigger sends.

What message would you like to send?
  This is the Message that will be sent as part of this schedule. You can select messages by their name, which may be different from the Schedule name. After selecting a Message a small inline preview of it will appear in the Schedule dialog.

Per user, what devices would you like to deliver to?
  This setting controls how Teak behaves when it is aware that a single user is playing the game across multiple devices.

  - **Their most recently used device**

    Teak will first identify what platforms the Message can be sent to based on if content has been set or not that for that platform. Then Teak will choose the most recently used device per user across all of those platforms, and deliver only to it. This is the default and is recommended for most cases, as it ensures that the user will only receive the Message once, and only on their most recently used device.
  - **All their devices**

    Teak will deliver the Message to all devices for all users. This can result in the same user receiving the same Message at the same time on multiple devices (e.g. on thier iPhone and iPad).
  - **Custom Device Priority**

    You may specify the priority order for platforms which Teak will select. Teak will first try to find the most recently used device for all 1st priority platforms, then all 2nd priority platforms, then all 3rd priority platforms, and will deliver to the first device found. For example, if a user plays on Facebook Canvas and on their iPhone, setting iOS to 1st priority and Facebook to 2nd priority will result in the Message only being sent to the user's iPhone even if the user had more recently plaed on Facebook Canvas

When would you like to send it?
  This setting controls when the Message will be sent.

  - **Later**

    Teak will send the notification at a later time, specified by **Send this message on**. By default, Teak will send the message at the given time in **your** timezone. You may instead select "Player's local time" to deliver the message at the given time in the **player's** timezone
    
    - **Send to users**

      - **all at once.**

        Teak will send the Message to all eligible users as quickly as possible. This can result in large spikes of users entering your game at the date/time given by **Send this message on**

      - **spread out over an hour.**

        Teak will identify all eligible users at the date/time given by **Send this message on** and then spread out the sending over an hour. This smooths out the spike of users entering your game and can be useful for preventing sudden spikes in server load.

    - **How often should this repeat?**

      - **Never**
        This Schedule will be processed and sent once.
      - **Daily**
        This Schedule will be processed every day, at the same time starting from the date and time given by **Send this message on**
      - **Weekly**
        This Schedule will be processed once a week, starting on and at the same time and on the same day of the week as given by **Send this message on**
      - **Biweekly**
        This Schedule will be processed every two weeks, starting on and at the same time and on the same day of the week as given by **Send this message on**
      - **Monthly**
        This Schedule will be processed once a month, starting on and at the same time and on the same day of the month as given by **Send this message on**.

  - **Now**

    Teak will immediately send the Message to all players in the Audience when you save the Schedule.

  - **Triggered**

    This Schedule will continually monitor its Audience and send the Message to players as they either enter or leave the Audience. This setting is most commonly used for new user and lapsed user notifications, as it will be sent based on the exact time each user installed or last played.

  - **Local**

    This Schedule will be sent based on direct requests from an integrated Teak SDK. Local schedules will ignore the **Who would you like to send the notification to?** and **Per user, what devices would you like to deliver to?** settings. Local schedules will only deliver to devices that have specifically requested them via a call to the integrated Teak SDK. 
