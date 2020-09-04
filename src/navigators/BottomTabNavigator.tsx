import React, {useState} from 'react'
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import CustomIcon from '../components/atoms/CustomIcon';
import SettingsScreen from "../screens/SettingsScreen/SettingsScreen";
import SocialScreen from "../WIP/SocialScreen";
import IntroScreen from "../screens/intro/intro";
import LoginScreen from "../screens/login";
import {Colors} from "../constants/styles/colors";
import {Dimensions, Text, TouchableOpacity, View} from "react-native";
import MyTabBar from "./MyTabBar";
import { NavigationContainer } from '@react-navigation/native';
import {navigate} from "./RootNavigation";


const Tab = createBottomTabNavigator();

interface Props {
    navigation: any;
}

const BottomTabsNavigator = (props: Props) => {
    const {navigation} = props
    const [tabScreenIndex, setTabScreenIndex] = useState(0);

    const _changeTabScreenIndex = (index: number, routerScreen: string) => {
        setTabScreenIndex(index);
        navigation.navigate(routerScreen);
    }

    return (
        <Tab.Navigator
            initialRouteName={'SettingsScreen'}
            backBehavior={'initialRoute'}
            tabBarOptions={{
                showLabel: false,
                activeTintColor: Colors.activeTab,
                inactiveTintColor: '#696869',
                style: {
                    width: Dimensions.get('screen').width
                },
                tabStyle: {
                    height: 80,
                    paddingLeft: 1,
                    borderWidth: 1,
                    width: 20
                },
            }}
        >
            <Tab.Screen
                name="LoginScreen"
                component={LoginScreen}
                options={{
                    tabBarLabel: '',
                    tabBarIcon: ({ color, size }) => (
                        <TouchableOpacity onPress={() => _changeTabScreenIndex(0, 'LoginScreen')} >
                            {
                                tabScreenIndex === 0 ? <View style={{flexDirection: 'row', borderRadius: 5,  backgroundColor: Colors.activeTab, justifyContent: 'flex-start', alignItems: 'center'}}>
                                    <CustomIcon name={'home'} size={24} color={'white'} style={{marginLeft: 12, marginTop: 8, marginBottom: 8}} />
                                    <Text style={{color: 'white', marginLeft: 10, marginRight: 12, fontSize: 15, fontFamily: 'helvetica-regular'}}>Страховка</Text>
                                </View> : <CustomIcon name={'home'} size={24} color={'black'} style={{marginLeft: 12, marginTop: 8, marginBottom: 8, borderWidth: 1, borderColor: 'blue'}} />
                            }
                        </TouchableOpacity>
                        // <CustomIcon name={'home'} size={24} color={color} />
                    )
                }}
            />

            <Tab.Screen
                name="SocialScreen"
                component={SocialScreen}
                options={{
                    tabBarLabel: '',
                    tabBarIcon: ({ color, size }) => (
                        <TouchableOpacity onPress={() => _changeTabScreenIndex(1, 'SocialScreen')} >
                            {
                                tabScreenIndex === 1 ? <View style={{flexDirection: 'row', borderRadius: 5,  backgroundColor: Colors.activeTab, justifyContent: 'flex-start', alignItems: 'center'}}>
                                    <CustomIcon name={'insurance'} size={24} color={'white'} style={{marginLeft: 12, marginTop: 8, marginBottom: 8}} />
                                    <Text style={{color: 'white', marginLeft: 10, marginRight: 12, fontSize: 15, fontFamily: 'helvetica-regular'}}>Страховка</Text>
                                </View> : <CustomIcon name={'insurance'} size={24} color={'black'} style={{marginLeft: 12, marginTop: 8, marginBottom: 8}} />
                            }
                        </TouchableOpacity>
                    )
                }}
            />

            <Tab.Screen
                name="IntroScreen"
                component={IntroScreen}
                options={{
                    tabBarLabel: '',
                    tabBarIcon: ({ color, size }) => (
                        <TouchableOpacity onPress={() => _changeTabScreenIndex(2, 'IntroScreen')} >
                            {
                                tabScreenIndex === 2 ? <View style={{flexDirection: 'row', borderRadius: 5,  backgroundColor: Colors.activeTab, justifyContent: 'flex-start', alignItems: 'center'}}>
                                    <CustomIcon name={'helper'} size={24} color={'white'} style={{marginLeft: 12, marginTop: 8, marginBottom: 8}} />
                                    <Text style={{color: 'white', marginLeft: 10, marginRight: 12, fontSize: 15, fontFamily: 'helvetica-regular'}}>Страховка</Text>
                                </View> : <CustomIcon name={'helper'} size={24} color={'black'} style={{marginLeft: 12, marginTop: 8, marginBottom: 8}} />
                            }
                        </TouchableOpacity>
                        // <CustomIcon name={'helper'} size={24} color={color} />
                    )
                }}
            />

            <Tab.Screen
                name="SettingsScreen"
                component={SettingsScreen}
                options={{
                    tabBarLabel: '',
                    tabBarIcon: ({ color, size }) => (
                        <TouchableOpacity onPress={() => _changeTabScreenIndex(3, 'SettingsScreen')} >
                            {
                                tabScreenIndex === 3 ? <View style={{flexDirection: 'row', borderRadius: 5,  backgroundColor: Colors.activeTab, justifyContent: 'flex-start', alignItems: 'center'}}>
                                    <CustomIcon name={'settings'} size={24} color={'white'} style={{marginLeft: 12, marginTop: 8, marginBottom: 8}} />
                                    <Text style={{color: 'white', marginLeft: 10, marginRight: 12, fontSize: 15, fontFamily: 'helvetica-regular'}}>Страховка</Text>
                                </View> : <CustomIcon name={'settings'} size={24} color={'black'} style={{marginLeft: 12, marginTop: 8, marginBottom: 8}} />
                            }
                        </TouchableOpacity>
                        // <CustomIcon name={'settings'} size={24} color={color} />
                    )
                }}
            />
        </Tab.Navigator>
    )
}

export default BottomTabsNavigator
