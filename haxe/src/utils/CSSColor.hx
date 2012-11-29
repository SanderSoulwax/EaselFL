package utils;

/**
 * Based on the class from FlashCanvas.
 * 
 * Example:
 * 
 * CSSColor.parse('#FF0000');
 * trace(CSSColor.color+', '+CSSColor.alpha);
 **/
/*
 * FlashCanvas
 *
 * Copyright (c) 2009      Shinya Muramatsu
 * Copyright (c) 2009-2011 FlashCanvas Project
 * Licensed under the MIT License.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * @author Colin Leung (developed ASCanvas)
 * @author Shinya Muramatsu
 * @see    http://code.google.com/p/ascanvas/
 */



    class CSSColor
    {
                
        inline static var hex3:EReg = ~/^#[0-9a-f]{3}$/;
        inline static var hex6:EReg = ~/^#[0-9a-f]{6}$/;
        inline static var rgb1:EReg = ~/^rgb\(\s*[+-]?\d+\s*,\s*[+-]?\d+\s*,\s*[+-]?\d+\s*\)$/;
        inline static var rgb2:EReg = ~/^rgb\(\s*[+-]?[\d.]+%\s*,\s*[+-]?[\d.]+%\s*,\s*[+-]?[\d.]+%\s*\)$/;
        inline static var rgba1:EReg = ~/^rgba\(\s*[+-]?\d+\s*,\s*[+-]?\d+\s*,\s*[+-]?\d+\s*,\s*[+-]?[\d.]+\s*\)$/;
        inline static var rgba2:EReg = ~/^rgba\(\s*[+-]?[\d.]+%\s*,\s*[+-]?[\d.]+%\s*,\s*[+-]?[\d.]+%\s*,\s*[+-]?[\d.]+\s*\)$/;
        inline static var hsl:EReg = ~/^hsl\(\s*[+-]?[\d.]+\s*,\s*[+-]?[\d.]+%\s*,\s*[+-]?[\d.]+%\s*\)$/;
        inline static var hsla:EReg = ~/^hsla\(\s*[+-]?[\d.]+\s*,\s*[+-]?[\d.]+%\s*,\s*[+-]?[\d.]+%\s*,\s*[+-]?[\d.]+\s*\)$/;

		public static var color(default, null):Int;
		public static var alpha(default, null):Float;

        private static var _names:Dynamic =
        {
            aliceblue:            0xF0F8FF,
            antiquewhite:         0xFAEBD7,
            aqua:                 0x00FFFF,
            aquamarine:           0x7FFFD4,
            azure:                0xF0FFFF,
            beige:                0xF5F5DC,
            bisque:               0xFFE4C4,
            black:                0x000000,
            blanchedalmond:       0xFFEBCD,
            blue:                 0x0000FF,
            blueviolet:           0x8A2BE2,
            brown:                0xA52A2A,
            burlywood:            0xDEB887,
            cadetblue:            0x5F9EA0,
            chartreuse:           0x7FFF00,
            chocolate:            0xD2691E,
            coral:                0xFF7F50,
            cornflowerblue:       0x6495ED,
            cornsilk:             0xFFF8DC,
            crimson:              0xDC143C,
            cyan:                 0x00FFFF,
            darkblue:             0x00008B,
            darkcyan:             0x008B8B,
            darkgoldenrod:        0xB8860B,
            darkgray:             0xA9A9A9,
            darkgreen:            0x006400,
            darkgrey:             0xA9A9A9,
            darkkhaki:            0xBDB76B,
            darkmagenta:          0x8B008B,
            darkolivegreen:       0x556B2F,
            darkorange:           0xFF8C00,
            darkorchid:           0x9932CC,
            darkred:              0x8B0000,
            darksalmon:           0xE9967A,
            darkseagreen:         0x8FBC8F,
            darkslateblue:        0x483D8B,
            darkslategray:        0x2F4F4F,
            darkslategrey:        0x2F4F4F,
            darkturquoise:        0x00CED1,
            darkviolet:           0x9400D3,
            deeppink:             0xFF1493,
            deepskyblue:          0x00BFFF,
            dimgray:              0x696969,
            dimgrey:              0x696969,
            dodgerblue:           0x1E90FF,
            firebrick:            0xB22222,
            floralwhite:          0xFFFAF0,
            forestgreen:          0x228B22,
            fuchsia:              0xFF00FF,
            gainsboro:            0xDCDCDC,
            ghostwhite:           0xF8F8FF,
            gold:                 0xFFD700,
            goldenrod:            0xDAA520,
            gray:                 0x808080,
            grey:                 0x808080,
            green:                0x008000,
            greenyellow:          0xADFF2F,
            honeydew:             0xF0FFF0,
            hotpink:              0xFF69B4,
            indianred:            0xCD5C5C,
            indigo:               0x4B0082,
            ivory:                0xFFFFF0,
            khaki:                0xF0E68C,
            lavender:             0xE6E6FA,
            lavenderblush:        0xFFF0F5,
            lawngreen:            0x7CFC00,
            lemonchiffon:         0xFFFACD,
            lightblue:            0xADD8E6,
            lightcoral:           0xF08080,
            lightcyan:            0xE0FFFF,
            lightgoldenrodyellow: 0xFAFAD2,
            lightgray:            0xD3D3D3,
            lightgreen:           0x90EE90,
            lightgrey:            0xD3D3D3,
            lightpink:            0xFFB6C1,
            lightsalmon:          0xFFA07A,
            lightseagreen:        0x20B2AA,
            lightskyblue:         0x87CEFA,
            lightslategray:       0x778899,
            lightslategrey:       0x778899,
            lightsteelblue:       0xB0C4DE,
            lightyellow:          0xFFFFE0,
            lime:                 0x00FF00,
            limegreen:            0x32CD32,
            linen:                0xFAF0E6,
            magenta:              0xFF00FF,
            maroon:               0x800000,
            mediumaquamarine:     0x66CDAA,
            mediumblue:           0x0000CD,
            mediumorchid:         0xBA55D3,
            mediumpurple:         0x9370DB,
            mediumseagreen:       0x3CB371,
            mediumslateblue:      0x7B68EE,
            mediumspringgreen:    0x00FA9A,
            mediumturquoise:      0x48D1CC,
            mediumvioletred:      0xC71585,
            midnightblue:         0x191970,
            mintcream:            0xF5FFFA,
            mistyrose:            0xFFE4E1,
            moccasin:             0xFFE4B5,
            navajowhite:          0xFFDEAD,
            navy:                 0x000080,
            oldlace:              0xFDF5E6,
            olive:                0x808000,
            olivedrab:            0x6B8E23,
            orange:               0xFFA500,
            orangered:            0xFF4500,
            orchid:               0xDA70D6,
            palegoldenrod:        0xEEE8AA,
            palegreen:            0x98FB98,
            paleturquoise:        0xAFEEEE,
            palevioletred:        0xDB7093,
            papayawhip:           0xFFEFD5,
            peachpuff:            0xFFDAB9,
            peru:                 0xCD853F,
            pink:                 0xFFC0CB,
            plum:                 0xDDA0DD,
            powderblue:           0xB0E0E6,
            purple:               0x800080,
            red:                  0xFF0000,
            rosybrown:            0xBC8F8F,
            royalblue:            0x4169E1,
            saddlebrown:          0x8B4513,
            salmon:               0xFA8072,
            sandybrown:           0xF4A460,
            seagreen:             0x2E8B57,
            seashell:             0xFFF5EE,
            sienna:               0xA0522D,
            silver:               0xC0C0C0,
            skyblue:              0x87CEEB,
            slateblue:            0x6A5ACD,
            slategray:            0x708090,
            slategrey:            0x708090,
            snow:                 0xFFFAFA,
            springgreen:          0x00FF7F,
            steelblue:            0x4682B4,
            tan:                  0xD2B48C,
            teal:                 0x008080,
            thistle:              0xD8BFD8,
            tomato:               0xFF6347,
            turquoise:            0x40E0D0,
            violet:               0xEE82EE,
            wheat:                0xF5DEB3,
            white:                0xFFFFFF,
            whitesmoke:           0xF5F5F5,
            yellow:               0xFFFF00,
            yellowgreen:          0x9ACD32
        };

        static public function parse(str:String) : Void//AlphaColor
        {
        	
        	if(str==null) {
        		str = 'transparent';
        	}
        	
        	
			str = (~/\s*$/).replace((~/^\s*/).replace(str.toLowerCase(),''), '');
			

			
				
            // #F00
            if (hex3.match(str))
            {
                var r:String = str.charAt(1);
                var g:String = str.charAt(2);
                var b:String = str.charAt(3);
                
                color = Std.parseInt("0x" + r + r + g + g + b + b);
                alpha = 1.0;                
            }

            // #FF0000
            else if (hex6.match(str))
            {
            	color = Std.parseInt("0x" + str.substr(1, 6));
            	alpha = 1.0;                
            }

            // rgb(255,0,0), rgb(100%,0%,0%)
            else if (rgb1.match(str) || rgb2.match(str))
            {
                //var rgb:Array<String> = str.slice(4, -1).split(",");
                var rgb:Array<String> = str.substr(4,str.length-5).split(",");
                color = rgb2hex(rgb);
                alpha = 1.0;
            }

            // rgba(255,0,0,1), rgba(100%,0%,0%,1)
            else if (rgba1.match(str) || rgba2.match(str))
            {
            					
                //var rgba:Array<String> = str.slice(5, -1).split(",");
                var rgba:Array<String> = str.substr(5, str.length-6).split(",");
                color = rgb2hex(rgba);
                alpha = Std.parseFloat(rgba[3]);                
            }

            // hsl(0,100%,50%)
            else if (hsl.match(str))
            {
                var hsl:Array<String> = str.substr(4, str.length-5).split(",");
               	color = hsl2hex(hsl);
               	alpha = 1.0;
            }

            // hsla(0,100%,50%,1)
            else if (hsla.match(str))
            {
                var hsla:Array<String> = str.substr(5, str.length-6).split(",");
                color = hsl2hex(hsla);
                alpha = Std.parseFloat(hsla[3]);
            }

            // red
            else if (Reflect.hasField(_names, str))//str in _names)
            {
                color = Reflect.field(_names, str);
                alpha = 1.0;
            }

            // transparent
            else if (str == "transparent")
            {
            	color = 0x000000;
            	alpha = 0.0;
            }

            // invalid color
            else
            {
            	color = 0x000000;
            	alpha = 0.0;
                throw 'Invalid CSS color argument: '+str;
            }
        }

        static private function rgb2hex(rgb:Array<String>):Int
        {
            var str:String;
            var num:Int;
            var val:Int = 0;
			
            for (i in 0...3)
            {
                str = rgb[i];
                if (str.indexOf("%") == -1){
                    num = Std.parseInt(str);
                }else{
                    num = Math.round(2.55 * Std.parseFloat(str));
                }

                // These values should be in the range [0, 255]. 
                val = val | ((num < 0 ? 0 : (num > 255) ? 255 : num) << ((2-i)*8));
            }

            return val;
        }

        static private function hsl2hex(hsl:Array<String>):Int
        {
            var h:Float = Std.parseFloat(hsl[0]) / 360;
            var s:Float = Std.parseFloat(hsl[1]) / 100;
            var l:Float = Std.parseFloat(hsl[2]) / 100;

            // these values should be in the range [0, 1].
            h -= Math.floor(h);
            s = (s < 0) ? 0 : (s > 1) ? 1 : s;
            l = (l < 0) ? 0 : (l > 1) ? 1 : l;

            var m2:Float = (l <= 0.5) ? l * (s + 1) : l + s - l * s;
            var m1:Float = l * 2 - m2;

            var r:Int = Std.int(hue2rgb(m1, m2, h + 1 / 3) * 255);
            var g:Int = Std.int(hue2rgb(m1, m2, h)         * 255);
            var b:Int = Std.int(hue2rgb(m1, m2, h - 1 / 3) * 255);

            return (r << 16) | (g << 8) | b;
        }

        static private function hue2rgb(m1:Float, m2:Float, h:Float):Float
        {
            if (h < 0)
                h++;
            else if (h > 1)
                h--;

            if (h < 1 / 6)
                return m1 + (m2 - m1) * h * 6;
            else if (h < 1 / 2)
                return m2;
            else if (h < 2 / 3)
                return m1 + (m2 - m1) * (2 / 3 - h) * 6;
            else
                return m1;
        }

    
}