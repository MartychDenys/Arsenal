import React, {useState, useRef} from 'react'
import {View, StyleSheet, TextInput, TouchableWithoutFeedback, TouchableOpacity} from 'react-native'

import { Feather } from '@expo/vector-icons';
import CustomIcon from './CustomIcon';
import {Colors} from "../../constants/styles/colors";

interface Props {
    placeholder?: string;
    onChangeText?: ((text: string) => void),
    style?: any,
    value: string
}

const PasswordInput = (props: Props) => {
    const {placeholder, onChangeText, style, value} = props
    const [hidePassword, setHidePassword] = useState(true)
    const inputRef = useRef<TextInput>(null)

    const _containerPress = () => {
        inputRef.current?.focus()
    }
    return (
        <TouchableWithoutFeedback onPress={_containerPress}>
            <View style={[styles.container, style]}>
                <CustomIcon name={'lock'} size={18} color="#A2A2A2" style={{marginRight: 8}} />
                <TextInput
                    ref={inputRef}
                    secureTextEntry={hidePassword}
                    style={styles.input}
                    placeholder={placeholder}
                    onChangeText={onChangeText}
                    value={value}
                />
                <TouchableOpacity onPress={() => setHidePassword(!hidePassword)}>
                    {
                        hidePassword ?
                            (<CustomIcon
                              name={'eye'}
                              size={18}
                              color={'#A2A2A2'}
                              style={{ marginLeft: 8}}
                            />)
                            :
                            (
                              <CustomIcon
                                name={'eye-cross'}
                                size={18}
                                color={'#A2A2A2'}
                                style={{ marginLeft: 8}}
                              />
                            )
                    }

                </TouchableOpacity>
            </View>
        </TouchableWithoutFeedback>
    )
};

const styles = StyleSheet.create({
    container: {
        flexDirection: 'row',
        alignItems: 'center',
        borderRadius: 8,
        backgroundColor: Colors.white,
    },
    input: {
        fontSize: 16,
        color: '#2C2B24',
        paddingVertical: 8,
        flex: 1
    }
})

export default PasswordInput
