import React from "react";
import {SafeAreaView, StyleSheet, Text, View} from "react-native";
import {ScreenTitle} from "../../components/Title";
import {Colors} from "../../constants/styles/colors";
import SettingSection from "./components/SettingSection";
import Svg, {Rect} from "react-native-svg";
import CustomIcon from "../../components/atoms/CustomIcon";

interface Props {

}

const SettingsScreen = (props: Props) => {
    return (
        <SafeAreaView style={{flex: 1}}>
            <View style={{flex: 1}}>
                <View style={styles.container}>

                    <ScreenTitle style={styles.settingTitle}>Налаштунки</ScreenTitle>

                    <SettingSection title='Мова додатку' text='Вибрано: Українська'>
                        <Svg width="20" height="13">
                            <Rect
                                x="0"
                                y="0"
                                width="20"
                                height="6.5"
                                fill="#338AF3"
                            />
                            <Rect
                                x="0"
                                y="6.5"
                                width="20"
                                height="6.5"
                                fill="#FFDA44"
                            />
                        </Svg>
                    </SettingSection>

                    <SettingSection title='Умови користування' text='Інструкція щодо використання'>
                        <CustomIcon name={'file'} color={'#FFF'} size={18} />
                    </SettingSection>

                    <SettingSection title='Вихід' text='Функції будуть вимкнені.'>
                        <CustomIcon name={'log-out'} color={'#FFF'} size={18} />
                    </SettingSection>
                </View>
                <View style={styles.versionTitle}>
                    <Text>Версія додатку: 0.0.1(beta)?</Text>
                </View>
            </View>
        </SafeAreaView>
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
        width: '100%',
        justifyContent: 'flex-start',
        alignItems: 'center',
        borderRadius: 10,
        shadowColor: "#000",
        shadowOffset: {
            width: 0,
            height: 2,
        },
        shadowOpacity: 0.25,
        shadowRadius: 3.84,
        backgroundColor: Colors.bgSettingBlock
    },
    versionTitle: {
        justifyContent: 'center',
        alignItems: 'center'
    },
    settingTitle: {
        marginTop: 32,
        marginBottom: 32
    }
})

export default SettingsScreen
