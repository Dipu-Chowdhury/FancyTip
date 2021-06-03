# Pre-work - *Fancy Tip*

**Fancy Tip** is a tip calculator application for iOS.

Submitted by: **Dipu Chowdhury**

Time spent: 6-8 hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] User can select between tip percentages by tapping different values on the segmented control and the tip value is updated accordingly

The following **optional** features are implemented:

* [x] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] The implementation of a Settings Page ViewController to allow for the user to adjust the tip levels to their desire.
- [x] A reset button that changes all the tip levels back to the originally suggested levels.
- [x] A split switch with a slider to prompt the user to interact more with the app while also providing the user with the amount that each group member must provide.


## Video Walkthrough

Here's a walkthrough of implemented user stories:


![](https://i.imgur.com/Kge9b7M.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

A challenge I faced while creating this project was understaing the Xcode framework and how the outlets were organized on the controller. When I deleted a previosuly made outlet, my whole code shut down and did not work. I spent a lot of time reviewing the systems framework to better understand how to erase outlets properly without running into issues with the rest of the code.

Another challenge I faced was fully understanding and correctly implementing the UserDefaults functions. I was able to later do this by analyzing other professional coders work on their iOS apps and understand why they implemented each line of their code. Doing so gave me a better understanding of all the functions to create the project you see above.

## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
