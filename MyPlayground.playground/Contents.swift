let zeroth_digit = ["zero","one","two","three","four","five","six","seven","eight","nine"]
let teen_digit = ["ten","eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen"]
let tenth_digit = [2:"twenty",3:"thirty",4:"fourty",5:"fifty",6:"sixty",7:"seventy",8:"eighty",9:"ninenty"]
let higher_digit = [2:"",3:"hundred",5:"thousand",7:"lakh",9:"crore"]

struct digitV {
    subscript(index: Int, value: Int) -> String {
        switch index {
            case 0:
                return teen_digit[value]
            case 1:
                return zeroth_digit[value]
            case 2,5,7,9:
                return tenth_digit[value]!
            case 3:
                return "\(zeroth_digit[value]) \(higher_digit[3]!) and"
            case 4,6,8:
                return "\(zeroth_digit[value]) \(higher_digit[index+1]!)"
            default:
                return "Nil"
        }
    }
}
func numToWords(num: Int) {
    let count = String(num).count
    var num_new = num
    
    var value = ""
    var prevString = ""
    var digit = 0
    let teenCheck = [2,5,7,9]
    
    let word = digitV()
    
    for i  in 1...count {
        let prev = digit
        if i%2==0 {
            prevString = value
        }
        digit = num_new%10
        num_new /= 10
        if teenCheck.contains(i) && digit==1{
            value = "\(word[0,prev]) \(higher_digit[i]!) \(prevString)"
        }
        else {
            value = "\(word[i,digit]) \(value) "
        }
    }
    
    print(value)
}

numToWords(num: 211212456)

