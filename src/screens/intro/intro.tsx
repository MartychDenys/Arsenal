import React, {useState, useRef} from 'react'
import {View, Text, StyleSheet, Dimensions, Image, TouchableOpacity, SafeAreaView} from 'react-native'

import {Colors} from "../../constants/styles/colors";
import Carousel from "react-native-snap-carousel";
import {slides} from "../../models/mocks/intro_slides";

// vector icons
import { MaterialIcons } from '@expo/vector-icons';

// constants
import {Constants} from "../../res/constants";
import {ScreenTitle, SubTitle} from "../../components/Title";
import IntroButton from "../../components/IntroButton";


interface Props {
    navigation: any
}

const screen = Dimensions.get('screen')
const SLIDER_WIDTH = Dimensions.get('window').width;
const ITEM_WIDTH = Math.round(SLIDER_WIDTH * 0.7);
const ITEM_HEIGHT = Math.round(ITEM_WIDTH * 3 / 4);


const IntroScreen = (props: Props) => {
    let [activeSlide, setSlide] = useState(0)
    const carouselRef = useRef(null)
    const {navigation} = props;

    // @ts-ignore
    const renderSlide = ({item}) => {
        return (
            <View key={item.id} style={styles.sliderContainer}>
                <Image style={styles.sliderImage} source={item.img} />

                <View style={{borderWidth: 1, borderColor: '#BDBDBD', height: 1, width: '90%'}}>
                </View>

                <View style={styles.sliderTextContainer}>
                    <View style={{alignItems: 'center'}}>
                        <ScreenTitle>{item.title}</ScreenTitle>
                        <SubTitle>{item.subTitle}</SubTitle>
                    </View>

                    <IntroButton nextIntroSlide={nextIntroSlide} activeSlide={activeSlide} />

                </View>

            </View>
        )
    }

    const nextIntroSlide = (): void => {
        if (activeSlide === slides.length - 1) {
            onSkipPressed()
        } else {
            // @ts-ignore
            carouselRef.current.snapToNext()
        }
    }

    const onSkipPressed = () => {
        if (activeSlide > 0) {
            navigation.replace('LoginScreen')
        }
    }

    const prevSlide = () => {
        if (activeSlide > 0) {
            // @ts-ignore
            carouselRef.current.snapToPrev()
        }
    }

    return (
        <SafeAreaView style={styles.container}>
            <View style={{flex: 1}}>
                <View style={styles.topCoordinator}>
                    <TouchableOpacity onPress={prevSlide}>
                        <MaterialIcons name="arrow-back" size={22} color={(activeSlide === 0) ? "#cfd4d6" : '#606E75'} />
                    </TouchableOpacity>

                    <TouchableOpacity onPress={onSkipPressed} style={{padding: 5}}>
                        <Text style={[styles.topCoordinatorText, {color: (activeSlide === 0) ? "#cfd4d6" : '#606E75'}]}>пропустити</Text>
                    </TouchableOpacity>
                </View>

                <Carousel
                    ref={carouselRef}
                    data={slides}
                    renderItem={renderSlide}
                    sliderWidth={SLIDER_WIDTH}
                    inactiveSlideShift={0}
                    itemWidth={screen.width}
                    onSnapToItem={(index: number) => setSlide(index)}
                />
            </View>
        </SafeAreaView>
    );
}

const styles = StyleSheet.create({

    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: Colors.white,
        marginBottom: 0,
        paddingBottom: 0
    },
    topCoordinator: {
        marginTop: 24,
        marginHorizontal: 16,
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'space-between',
    },
    topCoordinatorText: {
        fontFamily: Constants.fonts.default,
        fontSize: 13,

        letterSpacing: 0.13
    },
    sliderContainer: {
        alignItems: 'center',
        flex: 1,
        backgroundColor: Colors.white
    },
    sliderTextContainer: {
        paddingTop: 50,
        justifyContent: 'space-between',
        alignItems: 'center',
        flex: 1,
        paddingHorizontal: 30,
    },
    sliderImage: {
        flex: 1,
        resizeMode: 'contain',
        justifyContent: 'flex-end'
    },
    bottomContainer: {
        backgroundColor: Colors.white,
        flexDirection: 'row',
        justifyContent: 'space-between',
        alignItems: 'center',
        width: '100%'
    },
    wrapCountText: {
        marginLeft: 16
    },
    countText: {
        color: '#8C8A78',
        fontSize: 15,
        letterSpacing: 0.45
    },
    buttonContinue: {
        backgroundColor: '#FFCA40',
        borderTopLeftRadius: 20
    }
})

export default IntroScreen
