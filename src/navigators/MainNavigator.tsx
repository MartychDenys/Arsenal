import React from 'react';
import {NavigationContainer} from '@react-navigation/native';
import {createStackNavigator} from '@react-navigation/stack';
import {navigationRef} from './RootNavigation';
import {Colors} from "../constants/styles/colors";
import IntroScreen from "../screens/intro/intro";
import BottomTabsNavigator from "./BottomTabNavigator";


const Stack = createStackNavigator();

const MainNavigator = (props: any) => {
    return (
        <NavigationContainer ref={navigationRef}>
            <Stack.Navigator screenOptions={{
                headerShown: false,
                headerTintColor: Colors.lightGray,
            }}>

                <Stack.Screen name="TabNavigator" component={BottomTabsNavigator}/>

                <Stack.Screen
                    name="IntroScreen"
                    component={IntroScreen}
                />
            </Stack.Navigator>
        </NavigationContainer>
    )
}

export default MainNavigator;
