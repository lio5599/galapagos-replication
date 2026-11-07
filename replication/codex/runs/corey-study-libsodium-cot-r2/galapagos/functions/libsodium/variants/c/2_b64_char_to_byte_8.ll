; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r2/functions/libsodium/variants/c/2_b64_char_to_byte_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r2/functions/libsodium/variants/c/2_b64_char_to_byte_8.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %x = alloca i32, align 4
  %zero = alloca i32, align 4
  %not_a = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %or = or i32 %sub, %sub1
  %not = xor i32 %or, -1
  %shr = lshr i32 %not, 8
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 65
  %and = and i32 %shr, %sub2
  %4 = load i32, ptr %u, align 4
  %sub3 = sub i32 %4, 97
  %5 = load i32, ptr %u, align 4
  %sub4 = sub i32 122, %5
  %or5 = or i32 %sub3, %sub4
  %not6 = xor i32 %or5, -1
  %shr7 = lshr i32 %not6, 8
  %6 = load i32, ptr %u, align 4
  %sub8 = sub i32 %6, 97
  %add = add i32 %sub8, 26
  %and9 = and i32 %shr7, %add
  %or10 = or i32 %and, %and9
  %7 = load i32, ptr %u, align 4
  %sub11 = sub i32 %7, 48
  %8 = load i32, ptr %u, align 4
  %sub12 = sub i32 57, %8
  %or13 = or i32 %sub11, %sub12
  %not14 = xor i32 %or13, -1
  %shr15 = lshr i32 %not14, 8
  %9 = load i32, ptr %u, align 4
  %sub16 = sub i32 %9, 48
  %add17 = add i32 %sub16, 52
  %and18 = and i32 %shr15, %add17
  %or19 = or i32 %or10, %and18
  %10 = load i32, ptr %u, align 4
  %xor = xor i32 %10, 43
  %sub20 = sub i32 0, %xor
  %not21 = xor i32 %sub20, -1
  %shr22 = lshr i32 %not21, 8
  %and23 = and i32 %shr22, 62
  %or24 = or i32 %or19, %and23
  %11 = load i32, ptr %u, align 4
  %xor25 = xor i32 %11, 47
  %sub26 = sub i32 0, %xor25
  %not27 = xor i32 %sub26, -1
  %shr28 = lshr i32 %not27, 8
  %and29 = and i32 %shr28, 63
  %or30 = or i32 %or24, %and29
  %and31 = and i32 %or30, 255
  store i32 %and31, ptr %x, align 4
  %12 = load i32, ptr %x, align 4
  %sub32 = sub i32 %12, 1
  %shr33 = lshr i32 %sub32, 8
  %and34 = and i32 %shr33, 255
  store i32 %and34, ptr %zero, align 4
  %13 = load i32, ptr %u, align 4
  %xor35 = xor i32 %13, 65
  %sub36 = sub i32 0, %xor35
  %shr37 = lshr i32 %sub36, 8
  %and38 = and i32 %shr37, 255
  store i32 %and38, ptr %not_a, align 4
  %14 = load i32, ptr %x, align 4
  %15 = load i32, ptr %zero, align 4
  %16 = load i32, ptr %not_a, align 4
  %and39 = and i32 %15, %16
  %or40 = or i32 %14, %and39
  ret i32 %or40
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
