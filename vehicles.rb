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
  attr_reader :components,
              :requirements

  Component = Struct.new(:amount, :size)
  Requirement = Struct.new(:amount, :size)

  def initialize(body_amount:,
                 body_size:,
                 engine_amount:,
                 engine_size:,
                 wheel_amount:,
                 wheel_size:)

    @components = componentize(body_amount: body_amount,
                               body_size: body_size,
                               engine_amount: engine_amount,
                               engine_size: engine_size,
                               wheel_amount: wheel_amount,
                               wheel_size: wheel_size)

    # Ruby's setter method doesn't play well with either multiple
    # arguments or keyword arguments.
    set_requirements
  end

  def drive
    all_requirements_met?
  end

  def set_requirements(body_amount: 1,
                       body_size: 'medium',
                       engine_amount: 1,
                       engine_size: 'medium',
                       wheel_amount: 4,
                       wheel_size: 'medium')

    body = Requirement.new(body_amount, body_size)
    engine = Requirement.new(engine_amount, engine_size)
    wheels = Requirement.new(wheel_amount, wheel_size)

    @requirements = {
      body: body,
      engine: engine,
      wheels: wheels
    }
  end

  private

  def componentize(body_amount:,
                   body_size:,
                   engine_amount:,
                   engine_size:,
                   wheel_amount:,
                   wheel_size:)

    body = Component.new(body_amount, body_size)
    engine = Component.new(engine_amount, engine_size)
    wheels = Component.new(wheel_amount, wheel_size)

    {
      body: body,
      engine: engine,
      wheels: wheels
    }
  end

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
  def initialize(body_amount:,
                 body_size:,
                 engine_amount:,
                 engine_size:,
                 wheel_amount:,
                 wheel_size:)
    super
    set_requirements(body_amount: 1,
                     body_size: 'medium',
                     engine_amount: 1,
                     engine_size: 'medium',
                     wheel_amount: 4,
                     wheel_size: 'medium')
  end
end

# This describes a motorcycle that drives if all required components are present
class Motorcycle < Vehicle
  def initialize(body_amount:,
                 body_size:,
                 engine_amount:,
                 engine_size:,
                 wheel_amount:,
                 wheel_size:)
    super
    set_requirements(body_amount: 1,
                     body_size: 'small',
                     engine_amount: 2,
                     engine_size: 'small',
                     wheel_amount: 2,
                     wheel_size: 'small')
  end
end
