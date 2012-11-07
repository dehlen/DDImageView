DDImageView
====

DDImageView gives you the ability to add a NSImageView to your Xcode project which is Drag&Drop enabled. Also the typically seen Drag&Drop Animation of NSImageViews was implemented.

<img src="http://img840.imageshack.us/img840/9236/bildschirmfoto20121107u.png" />

## Installation

Super simple. Just drag & drop DDImageView.h/.m into your project. In your Project, find the .xib or .storyboard file and go to the Identitiy inspector of your NSImageView. Just enter DDImageView in the Custom Class Textfield and you should good to go.

## Usage

If you want to support other or more files then just images have a look in 
```
-(BOOL)performDragOperation:(id <NSDraggingInfo>)sender {
```
and change the NSPasteboard Types.

If you want to change the label "Drop Image Here" have a look at the
```
-(void)drawRect:(CGRect)rect {
```
## ARC

This version uses only ARC. If you still use MRC in your project feel free to fork this project. Also you will get 1 error by first start of the project. This is because it will recognize that you do not use ARC and will give you a solution how to implement this arc file in your non-arc project.

## Contact

* [@da_eh](https://twitter.com/da_eh) on Twitter
* <a href="mailTo:dehlen@me.com">dehlen [at] me [dot] com</a>

## License

Copyright (c) 2012 David Ehlen

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.