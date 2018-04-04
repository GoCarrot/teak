.. Teak: Unity documentation master file, created by
   sphinx-quickstart on Tue Aug 29 19:04:36 2017.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Getting started with Teak on Unity
==================================

.. toctree::
   :maxdepth: 2
   :hidden:

   unity
   android
   ios
   ios-extensions
   working-with-unity
   it-broke

Hey there!

We know integrating SDKs isn't your favorite thing in the world, but we're going to make this as painless as possible.

We're going to give you step-by-step instructions for integrating Teak with Unity for iOS and Android, how to test your integration, and how to fix errors you may run into.

.. tip:: You can always ask us for help, don't be shy.

Here is an overview of what we'll be doing.

Unity
-----
* Import *Teak.unitypackage*
* Call ``Teak.Instance.IdentifyUser()`` in your Unity code

Android
-------
* Get Teak working with the Native Android activity
* Ensure the credentials in ``res/values/teak.xml`` are correct
* Modify your ``AndroidManifest.xml`` to include Teak things

iOS
---
* Ensure the credentials in ``Info.plist`` and your game's entitlements files are correct
* 🎉 Pat yourself on the back, because you did it 🎉
