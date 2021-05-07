import React, {useState, useEffect} from 'react'
import {View, Text, StyleSheet, GestureResponderEvent, TouchableOpacity} from 'react-native'


interface Props {
    icon?: any;
    size: number;
    containerStyle?: any;
    style?: any;
    onPress?: (event: GestureResponderEvent) => void;
    text?: string,
    textStyle?: any
}

const SocialButton = (props: Props) => {
    const {icon, size, style, onPress, containerStyle, text, textStyle} = props

    const dynamicStyles = {
        width: size,
        height: size,
        borderRadius: 2.6,
    }
    return (
        <TouchableOpacity activeOpacity={0.7} onPress={onPress} style={[containerStyle, {justifyContent: 'center', alignItems: 'center'}]} >
            <View style={[styles.container, style, {...dynamicStyles}]}>
                {icon && icon()}
            </View>
            <Text style={textStyle}>{text}</Text>
        </TouchableOpacity>
    )
}

const styles = StyleSheet.create({
    container: {
        justifyContent: 'center',
        alignItems: 'center',
    }
})

export default SocialButton
