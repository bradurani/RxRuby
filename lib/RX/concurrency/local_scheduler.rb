# Copyright (c) Microsoft Open Technologies, Inc. All rights reserved. See License.txt in the project root for license information.

require 'rx/concurrency/scheduler'

module RX
	# Abstract base class for machine-local schedulers, using the local system clock for time-based operations.
	class LocalScheduler < RX::Scheduler

		# Gets the scheduler's notion of current time.
		def now
			Time.new
		end

		# Schedules an action to be executed.
		def schedule_with_state(state, action)
			raise Exception.new 'action cannot be nil' if action.nil?

			self.schedule_relative_with_state(state, 0, action)
		end

		# Schedules an action to be executed at dueTime.
		def schedule_absolute_with_state(state, due_time, action)
			raise Exception.new 'action cannot be nil' if action.nil?

			self.schedule_relative_with_state(state, (due_time - self.now), action)
		end

	end
end