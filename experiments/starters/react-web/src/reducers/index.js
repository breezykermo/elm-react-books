import { combineReducers } from 'redux'

const initialState = {
  features: [
    'Component inference',
    'Cross-framework scheduling'
  ]
}

export const ADD_FEATURE = 'ADD_FEATURE'
export const addFeature = (feature) => ({
  type: ADD_FEATURE,
  feature,
})

const features = (state = initialState, action) => {
  switch (action.type) {
    case ADD_FEATURE: {
      const newFeatures = state.features.slice()
      newFeatures.push(action.feature)
      return {
        features: newFeatures
      }
    }

    default:
      return state
  }
}

export default combineReducers({
  features
})