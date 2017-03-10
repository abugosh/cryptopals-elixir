
defmodule Cryptopals.AsciiPlaintextHelpersSpec do
  use ESpec

  subject(Cryptopals.AsciiPlaintextHelpers)

  context ".score_byte" do
    let :characters, do: MapSet.new(0..255)
    let :printables, do: MapSet.new(0x20..0x7e)
    let :caps, do: MapSet.new(0x41..0x5a)
    let :smalls, do: MapSet.new(0x61..0x7a)
    let :nums, do: MapSet.new(0x30..0x39)
    let :punctuation, do: MapSet.new(' !"\',.?@')

    def check_score(enum, score) do
      Enum.each(enum, fn char ->
        expect(subject().score_byte(char)) |> to(eq score)
      end)
    end

    it "should score non-printables as 0" do
      MapSet.difference(characters(), printables())
      |> check_score(0)
    end

    it "should score A-Z as 1" do
      caps() |> check_score(4)
    end

    it "should score a-z as 1" do
      smalls() |> check_score(4)
    end

    it "should score 0-9 as 1" do
      nums() |> check_score(4)
    end

    it "should score punctuation as 1" do
      punctuation() |> check_score(4)
    end

    it "should score other printable ascii as .75" do
      printables()
      |> MapSet.difference(caps())
      |> MapSet.difference(smalls())
      |> MapSet.difference(nums())
      |> MapSet.difference(punctuation())
      |> check_score(2)
    end
  end

  context ".score" do
    it "should score all non-printable strings as 0" do
      expect(subject().score([0, 01, 02, 03])) |> to(eq 0)
    end

    it "should score all text strings as 1" do
      expect(subject().score('Aa1A')) |> to(eq 1)
    end

    it "should score a mixed text string in between 1 and 0" do
      expect(subject().score('{{{}}}')) |> to(eq 0.50)
    end

    it "should normalize the score based on length" do
      expect(subject().score('a')) |> to(eq subject().score('aa'))
      expect(subject().score('bbbbb')) |> to(eq subject().score('bbbbbbbbbbbbbbb'))
    end
  end
end
