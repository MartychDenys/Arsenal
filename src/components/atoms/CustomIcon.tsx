import React, {useState, useEffect} from 'react'
import {View, Text, StyleSheet} from 'react-native'


// @ts-ignore
import FileIcon from '../../../assets/icons/file.svg';
import Lock from '../../../assets/icons/lock.svg';
import Eye from '../../../assets/icons/eye.svg';
import EyeCross from '../../../assets/icons/eye-cross.svg';

// import Copy from '../../../assets/icons/copy.svg'
// import Edit from '../../../assets/icons/edit.svg'
// import Eye from '../../../assets/icons/eye.svg'
// import EyeCross from '../../../assets/icons/eye-cross.svg'
// import FileText from '../../../assets/icons/file-text.svg'
// import Lock from '../../../assets/icons/lock.svg'
// import Message from '../../../assets/icons/message.svg'
// import Minus from '../../../assets/icons/minus.svg'
// import Plus from '../../../assets/icons/plus.svg'
// import Settings from '../../../assets/icons/settings.svg'
// import ShoppingBag from '../../../assets/icons/shopping-bag.svg'
import Smartphone from '../../../assets/icons/smartphone.svg'
import Telegram from '../../../assets/icons/telegram.svg'
import UkIcon from '../../../assets/icons/uk-icon.svg'
import ArrowRight from '../../../assets/icons/arrow-right.svg'
import LogOut from '../../../assets/icons/log-out.svg'
import User from '../../../assets/icons/user.svg'
import Home from '../../../assets/icons/home.svg'
import Insurance from '../../../assets/icons/insurance.svg'
import Helper from '../../../assets/icons/helper.svg'
import Setting from '../../../assets/icons/settings.svg'
// import Viber from '../../../assets/icons/viber.svg'
// import Exit from '../../../assets/icons/exit.svg'
// import Close from '../../../assets/icons/close.svg'
// import IconActiveLang from '../../../assets/icons/icon-active-lang.svg'


interface Props {
  name: string;
  size?: number;
  color?: string;
  style?: any;
}

const CustomIcon = (props: Props) => {
  const {name, size, color, style} = props;

  const iconSize = size || 16;
  const iconColor = color || 'white'


  switch (name) {
    case 'file': return <FileIcon style={[style]} width={iconSize} stroke={iconColor} />
    case 'log-out': return <LogOut style={[style]} width={iconSize} stroke={iconColor} />
    case 'home': return <Home style={[style]} width={iconSize} stroke={iconColor} />
    case 'insurance': return <Insurance style={[style]} width={iconSize} stroke={iconColor} />
    case 'helper': return <Helper style={[style]} width={iconSize} stroke={iconColor} />
    case 'settings': return <Setting style={[style]} width={iconSize} stroke={iconColor} />
    // case 'copy': return <Copy style={[style]} width={iconSize} height={iconSize} stroke={iconColor} />
    // case 'edit': return <Edit style={[style]} width={iconSize} height={iconSize} stroke={iconColor} />
    case 'eye': return <Eye style={[style]} width={iconSize} height={iconSize} stroke={iconColor} />
    case 'eye-cross': return <EyeCross style={[style]} width={iconSize} height={iconSize} stroke={iconColor} />
    // case 'file-text': return <FileText style={[style]} width={iconSize} height={iconSize} stroke={iconColor} />
    case 'lock': return <Lock style={[style]} width={iconSize} height={iconSize} stroke={iconColor} />
    // case 'message': return <Message style={[style]} width={iconSize} height={iconSize} stroke={iconColor} />
    // case 'minus': return <Minus style={[style]} width={iconSize} height={iconSize} stroke={iconColor} />
    // case 'plus': return <Plus style={[style]} width={iconSize} height={iconSize} stroke={iconColor} />
    // case 'settings': return <Settings style={[style]} width={iconSize} height={iconSize} stroke={iconColor} />
    // case 'shopping-bag': return <ShoppingBag style={[style]} width={iconSize} height={iconSize} stroke={iconColor} />
    case 'smartphone': return <Smartphone style={[style]} width={iconSize} height={iconSize} stroke={iconColor} />
    case 'telegram': return <Telegram style={[style]} width={iconSize} height={iconSize} stroke={iconColor} />
    case 'uk-icon': return <UkIcon style={[style]} width={iconSize} height={iconSize} stroke={iconColor} />
    case 'arrow-right': return <ArrowRight style={[style]} width={iconSize} height={iconSize} stroke={iconColor} />
    case 'user': return <User style={[style]} width={iconSize} height={iconSize} stroke={iconColor} />
    // case 'viber': return <Viber style={[style]} width={iconSize} height={iconSize} stroke={iconColor} />
    // case 'exit': return <Exit style={[style]} width={iconSize} height={iconSize} stroke={iconColor} />
    // case 'close': return <Close style={[style]} width={iconSize} height={iconSize} stroke={iconColor} />
    // case 'icon-active-lang': return <IconActiveLang style={[style]} width={iconSize} height={iconSize} />

    default: return <Text style={{fontSize: 10, color: 'red'}}>No icon with name: '{name}'</Text>
  }
}

const styles = StyleSheet.create({})

export default CustomIcon
