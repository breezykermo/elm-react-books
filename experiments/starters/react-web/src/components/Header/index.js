import React, { PropTypes } from 'react'
import logo from '../../logo.svg'
import './Header.css'

class Header extends React.Component {
  static propTypes = {
    title: PropTypes.string,
    className: PropTypes.string
  };
  static defaultProps = {
    title: 'Header'
  };

  render() {
    const { className, title } = this.props;
    return (
      <div className={className}>
        <img src={logo} className="App-logo" alt="logo" />
        <h2>{title}</h2>
      </div>
    )
  }
}

export default Header