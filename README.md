# VK authorization

I read a good article how make OAuth2 authorization without external libraries:
https://medium.com/swlh/how-to-build-an-ios-app-with-oauth2-authentication-flow-github-example-part-1-ca4be718d5c4

And had going to repeat this, but on VK authorization. During the work, 

I discovered that vk api don't allow custom redirect urls for standalone apps. 

The task became more simply: open webView and parse token from url after authorization.


For use received token I create simple TableView like  https://github.com/evgenvanzhukov/DI-tutorial 
for show friend list obtained by api.vk.com

![image](https://user-images.githubusercontent.com/29074231/215410685-812568f2-c905-47f1-8a29-312788be6732.png)
