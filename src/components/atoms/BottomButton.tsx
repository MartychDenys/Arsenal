import React, {useState, useEffect} from 'react'
import {View, Text, StyleSheet, TouchableOpacity} from 'react-native'
import {Colors} from "../../constants/styles/colors";


interface Props {
    text: string,
    textColor?: string,
    style: any,
    stylesText?: any,
    onPress: () => void
}

const BottomButton = (props: Props) => {
    const {text, style, stylesText, textColor, onPress} = props;

    return (
        <TouchableOpacity onPress={onPress} style={style}>
            <Text style={[styles.text, {color: textColor || Colors.black}]}>{text}</Text>
        </TouchableOpacity>
    )
}

const styles = StyleSheet.create({
    text: {
        fontSize: 15,
        paddingTop: 30,
        paddingBottom: 30,
        paddingLeft: 16,
        paddingRight: 16,
        color: Colors.black,
        letterSpacing: 0.45
    }
})

export default BottomButton;
