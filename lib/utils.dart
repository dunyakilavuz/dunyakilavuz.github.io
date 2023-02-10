// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:html' as html;

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
                customBorder: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0),),
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

    static TableRow tableRowSeperator(double height)
    {
        return TableRow
        (
            children: 
            [
                SizedBox(height: height,),
                SizedBox(height: height,),
                SizedBox(height: height,),
            ]
        );
    }

    static Container imageGallery(List<String> images, double height)
    {
        final ScrollController scrollController = ScrollController();

        return Container
        (
            height: height,
            decoration: BoxDecoration
            (
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(18.0),
            ),
            child: Scrollbar
            (
                thumbVisibility: true,
                controller: scrollController,
                child: ListView.builder
                (
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index)
                    {
                        return Container
                        (
                            color: Colors.grey,
                            margin: const EdgeInsets.all(20),
                            child: Image.asset(images.elementAt(index), height: height,),
                        );
                    }
                )
            )
        );
    }

    static void openURLatNewTab(String url)
    {
        html.window.open(url, 'new tab');
    }
}