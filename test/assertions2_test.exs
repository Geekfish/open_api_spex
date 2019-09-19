defmodule OpenApiSpex.Assertions2Test do
  use ExUnit.Case
  alias OpenApiSpex
  alias OpenApiSpexTest.{ApiSpec, Schemas}
  import OpenApiSpex.Test.Assertions2

  describe "assert_schema/3" do
    test "success with simple ref" do
      user = %{
        "id" => 123,
        "name" => "Joe User",
        "email" => "joe@gmail.com",
        "inserted_at" => "2017-09-12T12:34:55Z",
        "updated_at" => "2017-09-13T10:11:12Z"
      }

      assert_schema(user, "User", ApiSpec.spec())
    end

    test "success with allOf ref" do
      dog = %{"bark" => "woof", "pet_type" => "Dog"}
      assert_schema(dog, "Dog", ApiSpec.spec())
    end

    test "success with oneOf ref" do
      dog = %{"bark" => "woof", "pet_type" => "Dog"}
      assert_schema(dog, "CatOrDog", ApiSpec.spec())
    end
  end
end
