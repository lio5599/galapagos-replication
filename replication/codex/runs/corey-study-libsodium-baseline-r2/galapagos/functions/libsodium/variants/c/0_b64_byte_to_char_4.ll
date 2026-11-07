; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r2/functions/libsodium/variants/c/0_b64_byte_to_char_4.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r2/functions/libsodium/variants/c/0_b64_byte_to_char_4.c"
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
  %upper = alloca i32, align 4
  %lower = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  store i32 %shr, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  store i32 %shr2, ptr %b, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub3 = sub i32 %2, 62
  %shr4 = lshr i32 %sub3, 8
  store i32 %shr4, ptr %c, align 4
  %3 = load i32, ptr %x.addr, align 4
  %add = add i32 %3, 65
  store i32 %add, ptr %upper, align 4
  %4 = load i32, ptr %b, align 4
  %5 = load i32, ptr %x.addr, align 4
  %add5 = add i32 %5, 71
  %and = and i32 %4, %add5
  store i32 %and, ptr %lower, align 4
  %6 = load i32, ptr %lower, align 4
  %7 = load i32, ptr %upper, align 4
  %8 = load i32, ptr %lower, align 4
  %xor = xor i32 %7, %8
  %9 = load i32, ptr %a, align 4
  %and6 = and i32 %xor, %9
  %xor7 = xor i32 %6, %and6
  store i32 %xor7, ptr %result, align 4
  %10 = load i32, ptr %b, align 4
  %not = xor i32 %10, -1
  %11 = load i32, ptr %c, align 4
  %and8 = and i32 %not, %11
  %12 = load i32, ptr %x.addr, align 4
  %add9 = add i32 %12, -4
  %and10 = and i32 %and8, %add9
  %13 = load i32, ptr %result, align 4
  %or = or i32 %13, %and10
  store i32 %or, ptr %result, align 4
  %14 = load i32, ptr %x.addr, align 4
  %xor11 = xor i32 %14, 62
  %sub12 = sub i32 0, %xor11
  %shr13 = lshr i32 %sub12, 8
  %not14 = xor i32 %shr13, -1
  %and15 = and i32 %not14, 43
  %15 = load i32, ptr %result, align 4
  %or16 = or i32 %15, %and15
  store i32 %or16, ptr %result, align 4
  %16 = load i32, ptr %x.addr, align 4
  %xor17 = xor i32 %16, 63
  %sub18 = sub i32 0, %xor17
  %shr19 = lshr i32 %sub18, 8
  %not20 = xor i32 %shr19, -1
  %and21 = and i32 %not20, 47
  %17 = load i32, ptr %result, align 4
  %or22 = or i32 %17, %and21
  store i32 %or22, ptr %result, align 4
  %18 = load i32, ptr %result, align 4
  %and23 = and i32 %18, 255
  ret i32 %and23
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
