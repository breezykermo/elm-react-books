import React, { PropTypes } from 'react'
import List from '../List'
import './FancyBox.css'

import { connect } from 'react-redux'
import { addFeature } from '../../reducers'

class FancyBox extends React.Component {
  static propTypes = {
    color: PropTypes.oneOf(['red','green','blue']),
    features: PropTypes.arrayOf(PropTypes.string),
    dispatch: PropTypes.func.isRequired /* comes from react-redux connect */
  }

  constructor(props) {
    super(props)
    this.onClickHandler = this.onClickHandler.bind(this)
  }

  onClickHandler() {
    this.props.dispatch(addFeature('A New Feature'))
  }

  render() {
    const { color, features } = this.props;
    return (
      <div className="box-container" style={{ borderColor: color }}>
        <h2>Fancy Box</h2>
        <p>Welcome to a component-hierarchised application.</p>
        <List title="Features" items={features} />
        <input type="text" />
        <button onClick={this.onClickHandler}>Add Feature</button>
      </div> 
    )
  }
}

export default connect(state => ({
  features: state.features.features
}))(FancyBox)
