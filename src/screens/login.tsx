import React, {useState, useRef, useEffect} from 'react'
import {
    View,
    StyleSheet,
    Dimensions,
    ImageBackground, Keyboard, ScrollView, Platform, ViewStyle, TouchableOpacity, Text
} from 'react-native'
import {Colors} from "../constants/styles/colors";
import {ScreenTitle, SubTitle} from "../components/Title";
import {TextInputMask} from "react-native-masked-text";
import CustomIcon from "../components/atoms/CustomIcon";
import ProgressButton from "../components/atoms/ProgressButton";
import PasswordInput from "../components/atoms/PasswordInput";
import BgLogo from "../components/atoms/BgLogo";
import {useKeyboardHandler} from "../services/helperService";


const {width, height} = Dimensions.get('screen')

interface Props {
    navigation: any
}

const LoginScreen = (props: Props) => {
    const {navigation} = props
    const [phoneStringNumber, setPhoneStringNumber] = useState('9999999999999') //380675238660
    const [keyboardHeight, setKeyboardHeight] = useState(0);
    const [password, setPassword] = useState('380675238660');

    const [isShowPasswordField, setIsShowPasswordField] = useState(false);

    // // phone input reference
    const phoneInputRef: any = useRef(null)


    function onKeyboardDidShow(e: any): void {
        setKeyboardHeight(e.endCoordinates.height);
    }

    function onKeyboardDidHide(): void {
        setKeyboardHeight(0);
    }

    useKeyboardHandler(onKeyboardDidShow, onKeyboardDidHide);

    const _onSubmitPress = () => {
        setIsShowPasswordField(true);
    }

    const scrollViewContainer: ViewStyle = Platform.OS === 'ios' ?
        ({
            flexGrow: 1,
            justifyContent: 'flex-start',
            paddingBottom: keyboardHeight > 0 ? keyboardHeight : 0
        })
        : ({
            height: height,
            justifyContent: 'flex-start'
        })


    const _onLoginPress = () => {
        console.log('_onLoginPress');
    }

    return (
        <ScrollView
            disableScrollViewPanResponder={false}
            style={{
                backgroundColor: '#fff',
            }}
            contentContainerStyle={scrollViewContainer}
        >
        <View style={styles.container}>
            <View style={{flex: 1}}>
                <BgLogo keyboardHeight={keyboardHeight} />

                <View style={{flex: 1, marginHorizontal: 16, marginTop: 33}}>
                    {
                        !isShowPasswordField ? <ScreenTitle style={{fontSize: 18}}>Авторизація користувача</ScreenTitle> : <ScreenTitle style={{fontSize: 18}}>Пароль</ScreenTitle>
                    }

                    {
                        !isShowPasswordField ? <SubTitle style={{fontSize: 13, textAlign: 'left', width: width * 0.65}}>Індетифікуйте себе щоб
                            використовувати усі привілегії додатку</SubTitle> : <SubTitle style={{fontSize: 13, textAlign: 'left', width: width * 0.65}}>Введіть пароль</SubTitle>
                    }

                    <View style={styles.formHolderWrapper}>
                        <View style={styles.formHolder}>
                            {
                                !isShowPasswordField ? <CustomIcon size={20} name={'file'} style={{marginBottom: 8, marginRight: 10}} /> : null
                            }

                            {
                                !isShowPasswordField ? <TextInputMask
                                    style={[styles.input, {marginBottom: 8}]}
                                    type={'only-numbers'}
                                    options={{
                                        maskType: 'BRL',
                                        withDDD: true,
                                        dddMask: '9999999999999'
                                    }}
                                    value={phoneStringNumber}
                                    onChangeText={(text: string) => setPhoneStringNumber(text)}
                                    maxLength={19}
                                    placeholder='phonePlaceholder'
                                    ref={phoneInputRef}
                                /> : <PasswordInput
                                    placeholder='passPlaceholder'
                                    value={password}
                                    onChangeText={(text: string) => setPassword(text)}
                                />

                            }
                        </View>


                        <View style={{flexDirection: 'row',  alignItems: 'center', marginTop: 32}}>
                            <ProgressButton
                                showProgress={false}
                                disabled={false}
                                style={{zIndex: 10, width: 131, height: 50}}
                                text={!isShowPasswordField ? 'Далі' :  'Увійти'}
                                onPress={ !isShowPasswordField ? _onSubmitPress : _onLoginPress}
                            />

                            {
                                isShowPasswordField ? <TouchableOpacity style={{marginLeft: 24, padding: 5}} onPress={() => {}}><Text style={{ color: Colors.mainColor}}>Забув пароль?</Text></TouchableOpacity> : null
                            }

                        </View>
                    </View>

                    <View style={styles.userTermsHolder}>
                        <Text style={{fontSize: 12}}>Натиснув кнопку я погоджуюсь із </Text>
                        <TouchableOpacity onPress={()=>{}}>
                            <Text style={{color: Colors.mainColor, fontSize: 12, textDecorationLine: 'underline', textDecorationColor: '#129747'}}>умовами користування</Text>
                        </TouchableOpacity>
                    </View>
                </View>
            </View>
        </View>
        </ScrollView>
    )
};

const styles = StyleSheet.create({
    container: {
        backgroundColor: '#fff',
        flex: 1,
        justifyContent: 'flex-start'
    },
    text: {
        fontSize: 17,
        fontWeight: '600',
        textAlign: 'center',
        marginBottom: 32
    },
    formHolderWrapper: {
        flex: 1,
        marginTop: 26
    },
    formHolder: {
        flexDirection: 'row',
        justifyContent: 'center',
        alignItems: 'center',
        borderBottomWidth: 1,
        borderBottomColor: '#E3E3E5'
    },
    input: {
        flex: 1,
        fontSize: 17,
        color: '#2C2B24',
        backgroundColor: Colors.white,

    },
    userTermsHolder: {
        flexDirection: 'row',
        flexWrap: 'wrap',
        justifyContent: 'center',
        paddingBottom: 32
    },
    userTermsText: {}
})

export default LoginScreen
