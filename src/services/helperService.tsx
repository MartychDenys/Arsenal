import {Keyboard} from "react-native";
import {useEffect} from "react";




export const useKeyboardHandler = (onKeyboardDidShow: (e: any) => void, onKeyboardDidHide: () => void) => {
    return useEffect(() => {
        Keyboard.addListener('keyboardDidShow', onKeyboardDidShow);
        Keyboard.addListener('keyboardDidHide', onKeyboardDidHide);
        return (): void => {
            Keyboard.removeListener('keyboardDidShow', onKeyboardDidShow);
            Keyboard.removeListener('keyboardDidHide', onKeyboardDidHide);
        };
    }, []);
}
