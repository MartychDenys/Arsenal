import React, {useState, useRef, useEffect} from 'react'
import {ImageBackground, Text, View} from "react-native";

interface Props {
    keyboardHeight?: number
}

const BgLogo = (props: Props) => {
    const {keyboardHeight} = props;
    return (
        <View style={{flex: 1}}>
            {
                keyboardHeight && keyboardHeight > 0 ?
                    <ImageBackground imageStyle={{resizeMode: 'cover'}}  source={require('../../../assets/images/mini-logo.png')} style={{flex: 1}} /> :
                    <ImageBackground imageStyle={{resizeMode: 'cover'}} source={require('../../../assets/images/logo-img.png')} style={{flex: 8}} />
            }
        </View>
    )
}

export default BgLogo;
