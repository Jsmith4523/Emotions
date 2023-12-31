# Emotions Unit 8

- App Overview: 'Emotions' will allow for someone to easily input how they feel at a current moment. When entering more emtoions, a user will see a curated feed of previous emotions that have let us to their current emotion.
- App Specs: A users can view their emotions using vertical page scrolling (similar to tiktok). When getting started, the application prompts the user to enter how they're feeling at the current moment. Where a user can enter more emotions by pressing the plus button within the navigation bar

# Handwritten Wireframe:
<img src='https://github.com/Jsmith4523/Emotions/blob/main/IMG_6538.jpeg' title='Video Walkthrough' width='250' alt='Video Walkthrough'/>

# Project Specs

- Tiktok-like feed (UIScrollView or UICollectionView)
- Persistant Storage (CoreData)
- MVC Design Pattern

- Implemented wire-frame layout within Storyboard
- Creating custom cell view classes

# Unit 9 Updates

<img src='https://github.com/Jsmith4523/Emotions/blob/main/Emotions%20Unit%209.gif' title='Video Walkthrough' width='350' alt='Video Walkthrough'/>

TikTok-like feed (UICollectionView)
Persistant Storage (UserDefaults)
MVC Design Pattern + Protocools

- Implemented vertical paging with collection view (tiktok-like behavior).
- 'Feeling' enum of up to five feelings.
- Error handling using do-catch.
- UINavigationController.

# Unit 10 Updates and Spring Goals

<img src='https://github.com/Jsmith4523/Emotions/blob/main/Emotions.gif' title='Video Walkthrough' width='350' alt='Video Walkthrough'/>

## Sprint Goals (Unit 10)
Since the Unit 9 submission of this project, I have determined one of more following issues with the application:
- [x] Inability to delete a emotion with button present.
- [x] 'Emotion' struct UUID is not being properly decoded as the 'id' property is immutable.
- [x] Issue where canceling the creation of  composing a new 'Emotion' causes the application to present a white view controller.
- [x] UI Layout issues within 'EmotionsCellView' that did not add the date UILabel as a subview with proper auto-layout constraints.

These issues should be fixed by the submission of Unit 10.

## Issues Fixed as of Unit 10
- Date of Memory now shows within the emotion cell view.
- UI Bug fixes and improvements.
- User can now delete a memory.
