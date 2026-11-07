; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/0_b64_byte_to_char_2.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/0_b64_byte_to_char_2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  store i32 %and, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  %and3 = and i32 %shr2, 255
  store i32 %and3, ptr %b, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub4 = sub i32 %2, 62
  %shr5 = lshr i32 %sub4, 8
  %and6 = and i32 %shr5, 255
  store i32 %and6, ptr %c, align 4
  %3 = load i32, ptr %a, align 4
  %4 = load i32, ptr %x.addr, align 4
  %add = add i32 %4, 65
  %and7 = and i32 %3, %add
  store i32 %and7, ptr %result, align 4
  %5 = load i32, ptr %a, align 4
  %not = xor i32 %5, -1
  %6 = load i32, ptr %b, align 4
  %and8 = and i32 %not, %6
  %7 = load i32, ptr %x.addr, align 4
  %add9 = add i32 %7, 71
  %and10 = and i32 %and8, %add9
  %8 = load i32, ptr %result, align 4
  %or = or i32 %8, %and10
  store i32 %or, ptr %result, align 4
  %9 = load i32, ptr %b, align 4
  %not11 = xor i32 %9, -1
  %10 = load i32, ptr %c, align 4
  %and12 = and i32 %not11, %10
  %11 = load i32, ptr %x.addr, align 4
  %add13 = add i32 %11, -4
  %and14 = and i32 %and12, %add13
  %12 = load i32, ptr %result, align 4
  %or15 = or i32 %12, %and14
  store i32 %or15, ptr %result, align 4
  %13 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %13, 62
  %sub16 = sub i32 0, %xor
  %shr17 = lshr i32 %sub16, 8
  %not18 = xor i32 %shr17, -1
  %and19 = and i32 %not18, 255
  %and20 = and i32 %and19, 43
  %14 = load i32, ptr %result, align 4
  %or21 = or i32 %14, %and20
  store i32 %or21, ptr %result, align 4
  %15 = load i32, ptr %x.addr, align 4
  %xor22 = xor i32 %15, 63
  %sub23 = sub i32 0, %xor22
  %shr24 = lshr i32 %sub23, 8
  %not25 = xor i32 %shr24, -1
  %and26 = and i32 %not25, 255
  %and27 = and i32 %and26, 47
  %16 = load i32, ptr %result, align 4
  %or28 = or i32 %16, %and27
  store i32 %or28, ptr %result, align 4
  %17 = load i32, ptr %result, align 4
  ret i32 %17
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
