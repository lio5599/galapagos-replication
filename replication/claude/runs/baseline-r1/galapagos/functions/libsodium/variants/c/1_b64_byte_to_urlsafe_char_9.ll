; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_9.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_urlsafe_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_urlsafe_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %alpha_upper = alloca i32, align 4
  %alpha_lower = alloca i32, align 4
  %digits = alloca i32, align 4
  %dash = alloca i32, align 4
  %underscore = alloca i32, align 4
  %k26 = alloca i32, align 4
  %k52 = alloca i32, align 4
  %k62 = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  store i32 %shr, ptr %k26, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  store i32 %shr2, ptr %k52, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub3 = sub i32 %2, 62
  %shr4 = lshr i32 %sub3, 8
  store i32 %shr4, ptr %k62, align 4
  %3 = load i32, ptr %k26, align 4
  %and = and i32 %3, 255
  %4 = load i32, ptr %x.addr, align 4
  %add = add i32 %4, 65
  %and5 = and i32 %and, %add
  store i32 %and5, ptr %alpha_upper, align 4
  %5 = load i32, ptr %k26, align 4
  %not = xor i32 %5, -1
  %and6 = and i32 %not, 255
  %6 = load i32, ptr %k52, align 4
  %and7 = and i32 %6, 255
  %and8 = and i32 %and6, %and7
  %7 = load i32, ptr %x.addr, align 4
  %add9 = add i32 %7, 71
  %and10 = and i32 %and8, %add9
  store i32 %and10, ptr %alpha_lower, align 4
  %8 = load i32, ptr %k52, align 4
  %not11 = xor i32 %8, -1
  %and12 = and i32 %not11, 255
  %9 = load i32, ptr %k62, align 4
  %and13 = and i32 %9, 255
  %and14 = and i32 %and12, %and13
  %10 = load i32, ptr %x.addr, align 4
  %add15 = add i32 %10, -4
  %and16 = and i32 %and14, %add15
  store i32 %and16, ptr %digits, align 4
  %11 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %11, 62
  %sub17 = sub i32 0, %xor
  %shr18 = lshr i32 %sub17, 8
  %not19 = xor i32 %shr18, -1
  %and20 = and i32 %not19, 255
  %and21 = and i32 %and20, 45
  store i32 %and21, ptr %dash, align 4
  %12 = load i32, ptr %x.addr, align 4
  %xor22 = xor i32 %12, 63
  %sub23 = sub i32 0, %xor22
  %shr24 = lshr i32 %sub23, 8
  %not25 = xor i32 %shr24, -1
  %and26 = and i32 %not25, 255
  %and27 = and i32 %and26, 95
  store i32 %and27, ptr %underscore, align 4
  %13 = load i32, ptr %alpha_upper, align 4
  %14 = load i32, ptr %alpha_lower, align 4
  %or = or i32 %13, %14
  %15 = load i32, ptr %digits, align 4
  %or28 = or i32 %or, %15
  %16 = load i32, ptr %dash, align 4
  %or29 = or i32 %or28, %16
  %17 = load i32, ptr %underscore, align 4
  %or30 = or i32 %or29, %17
  ret i32 %or30
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
