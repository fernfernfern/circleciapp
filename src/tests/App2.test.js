import React from 'react'
import { shallow } from 'enzyme'
import App from '../App'
import sleep from '../tools'

it('changes the text on click', () => {
  const wrapper = shallow(<App/>)
  let text = wrapper.find('.text-container')
  sleep(10)
  expect(text.exists()).toBe(true)
  expect(wrapper.state('words')).toBe('')
  wrapper.find('button').simulate('click')
  text = wrapper.find('.text-container')
  expect(text.text()).toBe(wrapper.state('words'))
})
