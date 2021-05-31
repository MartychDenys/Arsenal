import React, {useState} from 'react'
import {View, Text, TouchableOpacity, StyleSheet} from 'react-native'
// import ProgressBar from './ProgressBar';
import {Colors} from "../../constants/styles/colors";

interface Prop {
  text: string;
  disabled?: boolean;
  onPress?: any;
  style?: any
  showProgress?: boolean;
}

const ProgressButton = (prop: Prop) => {
  const {text, disabled, onPress, style, showProgress} = prop
  const [dimension, setDimension] = useState<any>(null)

  return (
    <TouchableOpacity
      onLayout={(event) => setDimension(event.nativeEvent.layout)}
      style={[styles.container, disabled && styles.disabled, style]}
      disabled={disabled}
      onPress={!disabled ? onPress : () => {}}
    >
      <View style={styles.innerContainer}>
        <Text style={styles.buttonText}>{text}</Text>
      </View>
    </TouchableOpacity>
  )
}


const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: Colors.mainColor,
    borderRadius: 5,
    paddingVertical: 15,
    opacity: 1,
    shadowColor: Colors.black,
    shadowOffset: {
      width: 0,
      height: 10,
    },
    shadowOpacity: 0.05,
    shadowRadius: 3.84,
    elevation: 10
  },
  disabled: {
    opacity: 0.5
  },
  innerContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center'
  },
  buttonText: {
    color: '#FFFFFF',
    fontSize: 17
  }
})

export default ProgressButton
