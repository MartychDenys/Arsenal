import {StyleSheet, TouchableOpacity, View} from "react-native";
import {Colors} from "../constants/styles/colors";
import React from "react";
import {Ionicons} from "@expo/vector-icons";
import {SubTitle} from "./Title";

import { AntDesign } from '@expo/vector-icons';

interface Props {
    nextIntroSlide?: () => void,
    activeSlide: number
}

export const IntroButton = (props: Props) => {
    const {nextIntroSlide, activeSlide} = props;

    return (
        <View style={{ justifyContent: 'center',
            alignItems: 'center',}}>
        <TouchableOpacity onPress={nextIntroSlide} style={styles.wrapApplyBtn}>
            <View style={styles.insideBtn}>
                {
                    activeSlide === 3 ? <AntDesign name="Safety" size={24} color={Colors.white} /> : <Ionicons name="ios-arrow-forward" size={24} color={Colors.white} />
                }
            </View>

            <View style={{position: "absolute", borderTopLeftRadius: 10, borderTopWidth: 1.4, borderTopColor: Colors.mainColor, borderLeftWidth: 1.4, borderLeftColor: Colors.mainColor,  top: 0, left: 0, width: 21, height: 21 }}>
            </View>

            <View style={{position: "absolute", borderTopRightRadius: 10, borderTopWidth: 1.4, borderTopColor: (activeSlide >= 1) ? Colors.mainColor : Colors.introBorderInactive, borderRightWidth: 1.4, borderRightColor: (activeSlide >= 1) ? Colors.mainColor : Colors.introBorderInactive, top: 0, right: 0, width: 21, height: 21 }}>
            </View>

            <View style={{position: "absolute", borderBottomLeftRadius: 10, borderBottomWidth: 1.4, borderBottomColor: (activeSlide >= 2) ? Colors.mainColor : Colors.introBorderInactive, borderLeftWidth: 1.4, borderLeftColor: (activeSlide >= 2) ? Colors.mainColor : Colors.introBorderInactive, bottom: 0, left: 0, width: 21, height: 21 }}>
            </View>

            <View style={{position: "absolute", borderBottomRightRadius: 10, borderBottomWidth: 1.4, borderBottomColor: (activeSlide >= 3) ? Colors.mainColor : Colors.introBorderInactive, borderRightWidth: 1.4, borderRightColor: (activeSlide >= 3) ? Colors.mainColor : Colors.introBorderInactive, bottom: 0, right: 0, width: 21, height: 21 }}>
            </View>
        </TouchableOpacity>
            <SubTitle style={{fontSize: 12, marginTop: 6, opacity: (activeSlide === 3) ? 1 : 0}}>почати страхування</SubTitle>
        </View>
    )
}

const styles = StyleSheet.create({
    wrapApplyBtn: {
        width: 90,
        height: 90,
        justifyContent: 'center',
        alignItems: 'center',
        position: 'relative',
        borderRadius: 10
    },
    insideBtn: {
        width: 67,
        height: 67,
        backgroundColor: Colors.mainColor,
        borderRadius: 10,
        justifyContent: 'center',
        alignItems: 'center'
    },
});

export default IntroButton;
