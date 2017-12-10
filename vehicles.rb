# Write a program that models the behaviour of the given vehicles.
#
# Requirements:
# 1. The program should have a 'drive' method that returns true if, and only if,
#    the vehicle has all the components it needs.
# 2. You're given a car, which has 4 medium wheels, 1 medium engine, and 1
#    medium body.
# 3. You're given a motorcycle, which has 2 medium wheels, 1
#    small engine, and 1 small body.

# This describes a vehicle that drives if all required components are present
class Vehicle
  attr_accessor :components,
                :requirements

  Component = Struct.new(:amount, :size)
  Requirement = Struct.new(:amount, :size)

  def initialize(args)
    @body = Component.new(args[:body_amount], args[:body_size])
    @engine = Component.new(args[:engine_amount], args[:engine_size])
    @wheels = Component.new(args[:wheel_amount], args[:wheel_size])
    @components = {
      body: @body,
      engine: @engine,
      wheels: @wheels
    }

    @body_requirement = Requirement.new(1, 'medium')
    @engine_requirement = Requirement.new(1, 'medium')
    @wheels_requirement = Requirement.new(4, 'medium')
    @requirements = {
      body: @body_requirement,
      engine: @engine_requirement,
      wheels: @wheels_requirement
    }
  end

  def drive
    all_requirements_met?
  end

  private

  def all_requirements_met?
    results = components.keys.map do |key|
      component_requirements_met?(component: components[key],
                                  requirement: requirements[key])
    end

    !results.include?(false)
  end

  def component_requirements_met?(component:, requirement:)
    component.amount == requirement.amount && component.size == requirement.size
  end
end

# This describes a car that drives if all required components are present
class Car < Vehicle
  def initialize(args)
    super
    @body_requirement = Requirement.new(1, 'medium')
    @engine_requirement = Requirement.new(1, 'medium')
    @wheels_requirement = Requirement.new(4, 'medium')
    @requirements = {
      body: @body_requirement,
      engine: @engine_requirement,
      wheels: @wheels_requirement
    }
  end
end

# This describes a motorcycle that drives if all required components are present
class Motorcycle < Vehicle
  def initialize(args)
    super
    @body_requirement = Requirement.new(1, 'small')
    @engine_requirement = Requirement.new(2, 'small')
    @wheels_requirement = Requirement.new(2, 'small')
    @requirements = {
      body: @body_requirement,
      engine: @engine_requirement,
      wheels: @wheels_requirement
    }
  end
end
