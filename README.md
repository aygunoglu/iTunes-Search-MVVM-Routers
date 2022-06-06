#  iTunes Search

## Screens

<p>
<img width="250px" src="https://user-images.githubusercontent.com/81817904/172258528-e011c9ac-5bc5-4f0a-b00c-8a18a93dc1cd.mp4">
<img width="250px" src="https://user-images.githubusercontent.com/81817904/172258550-1f0240a6-89e5-4615-ba83-e3fb1a546fb4.mp4">
<img width="250px" src="https://user-images.githubusercontent.com/81817904/172259045-3a6badd3-e469-4fac-b139-66479c0f19e7.mov">
</p>

## Dependencies

### [Cocoapods](https://github.com/CocoaPods/CocoaPods)

### [Moya](https://github.com/Moya/Moya)

### [Kingfisher](https://github.com/onevcat/Kingfisher)

## Some notes on the app

* The iTunes Search API documentation does not include any info on how to handle pagination. There's a "secret" offset parameter (can only be found through googling) that does let you offset the data, however, this does not work properly and causes dublicate item returns, which might be the reason why it's not documented. Though, despite the API problems, I've still written an Infinite scrolling implementation and it works with no issues. 

