# cmd-chatbot
#### A chat bot written in batch that can be taught.

The **logic** behind this one is as simple as using a couple of **if-else** conditions. If you know the basics you can write one of your own using simple commands such as **echo**, **if**, **else**, etc... and a few **redirection operators** such as '**>**' or '**>>**'

Basically, it learns by imitating you. For anything new you enter, Hex will ask for the reply to it, and the moment you type in the reply to that '**text**', it will immediately save that reply inside a file named with the text in the '**Replylog**' folder. Next thing, it searches for the text you type, in the **replylog** folder, and replies if it finds the phrase in there. If it doesn't the phrase in there it will simply prompt you for a reply to that text.

Since we are using **batch** and not **python** or some advanced programming language, we are only limited to using those **characters** that are not special characters in **windows batch** (for example '**|**' means to **pipe** in batch), since windows won't allow it. So you might come across some **error** messages but as soon as you keep in mind that it's simply my first project ever and not some freaking software, you won't need those special characters. You can use most of them but not all.

Finally, since I haven't trained Hex a lot so it is simply frustrating at this point to talk with it. But if you keep in mind that it's recording all of that you say, you can improve it a lot. The path to "**Replylog**" folder is this: **Hex\Chats\Replylog** so you can delete it anytime, in case you want to clear Hex's memory. Next time Hex would copy the contents from **NoReplylog** folder to the **replylog** folder. If you keep playing around this a lot, you can share you **replylog** folder with me, so that I can copy it's contents and paste them into the **main branch** and Hex will have more to say. You can add anything to it, if you want to make it better. Any suggestions are welcomed. Contact me at _mystudyidhere@gmail.com_ for that matter.

Thanks for having a look at my pathetic program. I'm grateful.

— Yogesh singh bora
