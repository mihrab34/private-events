require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test 'should get index' do
    get events_index_url
    assert_response :success
  end

  test 'should get new' do
    get new_event_url
    assert_response :success
  end

  test 'should create event' do
    get events_create_url
    assert_response :success
  end

  test 'should show event' do
    get event_url(@event)
    assert_response :success
  end

  # rubocop:disable Layout/LineLength
  test 'should update event' do
    patch event_url(@event), params: { event: { creator_id: @event.creator_id, location: @event.location, date: @event.date, description: @event.description, title: @event.title } }
    assert_redirected_to event_url(@event)
  end
  # rubocop:enable Layout/LineLength

  test 'should destroy event' do
    assert_difference('Event.count', -1) do
      delete event_url(@event)
    end

    assert_redirected_to events_url
  end
end
