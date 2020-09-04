import { StatusBar } from 'expo-status-bar';
import React, {useState} from 'react';
import { StyleSheet, Text, View } from 'react-native';
import * as Font from 'expo-font';
import {AppLoading} from "expo";
import MainNavigator from "./src/navigators/MainNavigator";


const fetchFonts = () => {
  return Font.loadAsync({
    'helvetica-regular': require('./assets/fonts/HelveticaRegular.ttf'),
    'friz-bold': require('./assets/fonts/FrizQuadrataCTT-bold.ttf'),
    'friz-regular': require('./assets/fonts/FrizQuadrataCTT.ttf'),
  });
}

export default function App() {
  const [dataLoaded, setDataLoaded] = useState(false);

  const loadData = () => {
    return fetchFonts().then();
  }

  if (!dataLoaded) {
    return <AppLoading
        startAsync={loadData}
        onFinish={() => setDataLoaded(true)}
        onError={(err: Error) => console.log(err)}
    />
  }

  return (
      <MainNavigator />
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
