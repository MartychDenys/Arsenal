import React, {useState} from "react";
import {StyleSheet, View} from "react-native";
import BgLogo from "../components/atoms/BgLogo";
import CustomIcon from "../components/atoms/CustomIcon";
import {Colors} from "../constants/styles/colors";
import {ScreenTitle, SubTitle} from "../components/Title";
import SocialButton from "../components/SocialButton";

interface Props {

}

const SocialScreen = (props: Props) => {
    return (
        <View style={styles.socialContainer}>
            <View style={styles.logoSection}>
                <BgLogo/>
            </View>

            <View style={[styles.formHolderWrapper]}>
                <ScreenTitle>Що у вас трапилось?</ScreenTitle>
                <SubTitle style={{marginBottom: 40}}>Зв’яжись із нами зручним способом</SubTitle>

                <View style={styles.socialContentSection}>
                    <View style={{marginRight: 32}}>
                        <SocialButton textStyle={{marginTop: 15}} style={{backgroundColor: Colors.socialBtnColor}}
                                      text='Дзвінок' size={56}
                                      icon={() => (<CustomIcon name={'smartphone'} size={29} color={Colors.white}/>)}/>
                    </View>
                    <View style={{marginLeft: 32}}>
                        <SocialButton textStyle={{marginTop: 15}} style={{backgroundColor: Colors.socialBtnColor}}
                                      text='Месенджер' size={56}
                                      icon={() => (<CustomIcon name={'telegram'} size={29} color={Colors.white}/>)}/>
                    </View>
                </View>
            </View>
        </View>
    )
}

const styles = StyleSheet.create({
    socialContainer: {
        flex: 1
    },
    logoSection: {
        flex: 1
    },
    formHolderWrapper: {
        marginTop: 26,
        alignItems: 'center'
    },
    socialContentSection: {
        flexDirection: 'row',
        justifyContent: 'center',
        alignItems: 'center',
        marginBottom: 48
    }
})

export default SocialScreen;
