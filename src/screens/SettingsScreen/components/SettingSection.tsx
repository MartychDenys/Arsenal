import React from "react";
import {StyleSheet, Text, TouchableOpacity, View} from "react-native";
import {Colors} from "../../../constants/styles/colors";
import Svg, {Rect} from "react-native-svg";
import CustomIcon from "../../../components/atoms/CustomIcon";


interface Props {
    title: string,
    text: string,
    children: any,
}

const SettingSection = (props: Props) => {
    const {title, text, children} = props;

    return (
        <View style={styles.settingBlock}>
            <View style={{justifyContent: 'center', alignItems: 'center'}}>
                <View style={{padding: 20, marginLeft: 16, borderRadius: 2.6, backgroundColor: Colors.socialBtnColor}}>
                    {children}
                </View>
            </View>

            <View style={{marginLeft: 18, flex: 1}}>
                <Text style={{margin: 0, padding: 0, marginBottom: 2}}>{title}</Text>
                <Text style={{margin: 0, padding: 0}}>{text}</Text>
            </View>

            <View style={[styles.btnRight, {justifyContent: 'center', alignItems: 'center', borderRadius: 7, borderWidth: 1, marginHorizontal: 16, backgroundColor: Colors.bgSettingRightBtn, }]}>
                <TouchableOpacity style={styles.btnRight}>
                    <CustomIcon name={'arrow-right'} size={29} color={Colors.white}/>
                </TouchableOpacity>

            </View>
        </View>
    )
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'flex-start',
        alignItems: 'center'
    },
    settingBlock: {
        flexDirection: 'row',
        height: 73,
        justifyContent: 'flex-start',
        alignItems: 'center',
        borderRadius: 10,
        shadowColor: "#000",
        marginBottom: 16,
        shadowOffset: {
            width: 0,
            height: 2,
        },
        shadowOpacity: 0.25,
        shadowRadius: 3.84,
        backgroundColor: Colors.bgSettingBlock,
    },
    btnRight: {
        shadowColor: "#000",
        shadowOffset: {
            width: 0,
            height: 2,
        },
        shadowOpacity: 0.25,
        shadowRadius: 3.84,
    }
})

export default SettingSection
