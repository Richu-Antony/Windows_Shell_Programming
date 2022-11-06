# Steganocet
Hide any secret information or files inside an image without anyone knowing.<br>
Download the latest stable version [here](https://github.com/AyushShahh/steganocet/releases/download/1.0.0/steganocet-main-v1.zip).

**Supported OS:** Windows<br>
Linux users can install the "wine" package on their system to run VBScript and batch files.<br>
Mac users can use Bootcamp to run VBScript and batch files.

## How to use?
Clone this repository or download the [zip source file](https://github.com/AyushShahh/steganocet/archive/refs/heads/main.zip).

```
git clone https://github.com/AyushShahh/steganocet.git
```
<br>

Copy the image inside which you want to hide the information/file in the `image` folder.
Do not use spaces in the image name.
<br><br>
Examples:<br>
:heavy_check_mark: cool_photo.png<br>
:heavy_check_mark: niceimage.jpg<br>
:x: aesthetic photo.png<br>
:x: yummy cake.jpg<br><br>

Copy everything you want to hide inside the `hidefile` folder.

Run `steganocet.bat` file and type the name of the image file in the `image` folder inside which you want to store information (with extension, case sensitive) and press enter.
>Type .jpg instead of .jpeg in image name extension if you are using image of that format.

An identical image with same name and format will be generated with your confidential files.

If you compare both images, you can't differentiate between them. They are similar and identical, but the new one contains everything you wanted to hide. Even the image properties remain same.

No one will ever know that it's not just an ordinary image.
> Note that the image size will increase by some ratio depending on the information you hide.

## How to access/extract the hidden information?
You can access the information using any zip extractor. The most popular ones are [WinRAR](https://www.win-rar.com/) and [7zip](https://www.7-zip.org/).

Right click on the new image file created and then select **Open with WinRAR** or **Open with 7 zip** or any other zip extracting program on your system.

If you can't find the option then go to your zip extractor program and open the image manually inside it.

## License
This project is licensed under the **Apache-2.0 License**. See the **[LICENSE](https://github.com/AyushShahh/steganocet/blob/main/LICENSE)** file for details.
