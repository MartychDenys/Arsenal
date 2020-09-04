import * as React from 'react';
import {CommonActions, StackActions} from '@react-navigation/native';

export const navigationRef: any = React.createRef();

export function navigate(name: string, params: any) {
    navigationRef.current?.navigate(name, params);
}

export function replaceNavigation(name: string) {
    navigationRef.current.dispatch(
      CommonActions.reset({
          index: 1,
          routes: [
              { name: name }
          ],
      })
    );
}
