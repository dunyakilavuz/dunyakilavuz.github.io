import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Utils
{
    static Material svgButton(SvgPicture svg, onTap, {bool enabled = true})
    {
        return  Material
        (
            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
            color: const Color.fromARGB(20, 255, 255, 255),
            child: enabled ?
            InkWell // Enabled
            (
                customBorder: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
                onTap: onTap,
                child: svg
            )
            :
            InkWell // Disabled
            (
                customBorder: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: onTap,
                child: svg
            )
        );
    }

    static SvgPicture svgIcon(String svg, Color color, double size)
    {
        String prefix = "assets/";
        String postfix = ".svg";
        return SvgPicture.asset
        (
            prefix + svg + postfix,
            color: color,
            width: size,
            height: size,
        );
    } 

    static Container columnSeperator(double height)
    {
        return Container(height: height);
    }

    static Container rowSeperator(double width)
    {
        return Container(width: width);
    }
}