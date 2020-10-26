# rubocop:disable Style/FrozenStringLiteralComment
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Style/NilComparison
# rubocop:disable Style/AsciiComments
# rubocop:disable Layout/IndentationConsistency
# rubocop:disable Style/RedundantReturn
# rubocop:disable Style/GuardClause
# rubocop:disable Style/IfUnlessModifier
# Quicksort ir Mergesort Ruby kalboje
# Abu algoritmai rūšiuoja O(n * lg(n)) laiku
# Quicksort veikia vietoje, kur Mergesort veikia naujame masyve

# Sorting Class
class Sort
  def quicksort(array, from = 0, to = nil)
    if to == nil
      # Pagal numatytuosius nustatymus rūšiuoti visą masyvą
      to = array.count - 1
    end
    if from >= to
      # Atliktas rūšiavimas
      return array
    end

  # Paimkite pivot vertę kairieje
  pivot = array[from]
  # Min ir Max rodyklės
  min = from
  max = to
  # Dabartinis laisvas langas
  free = min
  while min < max
    if free == min # Įvertinti array[max]
      if array[max] <= pivot # Mažesnis nei pivot, turi judėti
        array[free] = array[max]
        min += 1
        free = max
      else
        max -= 1
      end
    elsif free == max # Įvertinti array[min]
      if array[min] >= pivot # Didesnis nei pivot, turi judėti
        array[free] = array[min]
        max -= 1
        free = min
      else
        min += 1
      end
    else
      raise 'Inconsistent state'
    end
  end
        array[free] = pivot
        quicksort array, from, free - 1
        quicksort array, free + 1, to
  end

  def mergesort(array)
    if array.count <= 1
      # 1 ar mažesnio ilgio masyvas visada rūšiuojamas
      return array
    end

        # Taikyti "Divide & Conquer" strategija
        # 1. Divide
        mid = array.count / 2
        part_a = mergesort array.slice(0, mid)
        part_b = mergesort array.slice(mid, array.count - mid)
        # 2. Conquer
        array = []
        offset_a = 0
        offset_b = 0
        while offset_a < part_a.count && offset_b < part_b.count
          a = part_a[offset_a]
          b = part_b[offset_b]
            # Paimti mažiausią iš dviejų ir stumti jį ant masyvo
            if a <= b
              array << a
              offset_a += 1
            else
              array << b
              offset_b += 1
            end
        end

        # Part_a arba part_b (ne abiejuose) yra likęs bent vienas elementas
        while offset_a < part_a.count
          array << part_a[offset_a]
          offset_a += 1
        end

        while offset_b < part_b.count
          array << part_b[offset_b]
          offset_b += 1
        end

        return array
  end

  # Ieškoti išrūšiuoto masyvo per O(lg(n)) laiką
  def binary_search(array, value, from = 0, to = nil)
    if to == nil
      to = array.count - 1
    end

    mid = (from + to) / 2

    if value < array[mid]
      return binary_search array, value, from, mid - 1
    elsif value > array[mid]
      return binary_search array, value, mid + 1, to
    else
      return mid
    end
  end
end

sorter = Sort.new

a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15].shuffle
# Quicksort veikia vietoje (t.y. pačiame "a")
# Perskirstyti nereikia
sorter.quicksort a
puts 'quicksort'
puts a

b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15].shuffle
# Mergesort veikia nauju masyvu
# Taigi turime perskirstyti
b = sorter.mergesort b
puts 'mergesort'
puts b

offset3 = sorter.binary_search a, 3
puts "3 is at offset #{offset3} in a"

offset15 = sorter.binary_search b, 15
puts "15 is at offset #{offset15} in b"

# rubocop:enable Style/FrozenStringLiteralComment
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Style/NilComparison
# rubocop:enable Style/AsciiComments
# rubocop:enable Layout/IndentationConsistency
# rubocop:enable Style/RedundantReturn
# rubocop:enable Style/GuardClause
# rubocop:enable Style/IfUnlessModifier
