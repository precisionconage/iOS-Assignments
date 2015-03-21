//
//  Shader.vsh
//  FBXTest
//
//  Created by Shane Spoor on 2015-03-10.
//  Copyright (c) 2015 BCIT. All rights reserved.
//

precision mediump float;

attribute vec4 position;
attribute vec3 normal;
attribute vec2 texCoordIn;

varying lowp vec4 colorVarying;
varying vec2 texCoordOut;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

void main()
{
    vec3 eyeNormal = normalize(normalMatrix * normal);
    vec3 lightPosition = vec3(0.0, 0.0, 1.0);
    vec4 diffuseColor = vec4(0.4, 0.4, 1.0, 1.0);
    
    float nDotVP = max(0.0, dot(eyeNormal, normalize(lightPosition)));
                 
    colorVarying = diffuseColor * nDotVP;
    
    texCoordOut = texCoordIn;
    
    gl_Position = modelViewProjectionMatrix * position;
}