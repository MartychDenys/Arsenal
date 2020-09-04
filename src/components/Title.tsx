import React from 'react';
import {Constants} from "../res/constants";
import {Colors} from "../constants/styles/colors";
import {Text} from 'react-native'

interface Props {
    style?: any;
    children?: any;
}

export const ScreenTitle = (props: Props) => {
    const {style, children} = props
    return (
        <Text style={[{
            fontFamily: Constants.fonts.bold,
            fontSize: 20,
            color: Colors.black,
            letterSpacing: 0.25,
            marginBottom: 16
        }, style]}>{children}</Text>
    )
}

export const SubTitle = (props: Props) => {
    const {style, children} = props
    return (
        <Text style={[{
            fontFamily: Constants.fonts.default,
            fontSize: 14,
            color: Colors.subTitleColor,
            letterSpacing: 0.13,
            lineHeight: 21,
            textAlign: 'center'
        }, style]}>{children}</Text>
    )
}
