; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_2.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_2.c"
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
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
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
  %3 = load i32, ptr %a, align 4
  %4 = load i32, ptr %x.addr, align 4
  %add = add i32 %4, 65
  %and = and i32 %3, %add
  store i32 %and, ptr %result, align 4
  %5 = load i32, ptr %a, align 4
  %not = xor i32 %5, -1
  %6 = load i32, ptr %b, align 4
  %and5 = and i32 %not, %6
  %7 = load i32, ptr %x.addr, align 4
  %add6 = add i32 %7, 71
  %and7 = and i32 %and5, %add6
  %8 = load i32, ptr %result, align 4
  %or = or i32 %8, %and7
  store i32 %or, ptr %result, align 4
  %9 = load i32, ptr %b, align 4
  %not8 = xor i32 %9, -1
  %10 = load i32, ptr %c, align 4
  %and9 = and i32 %not8, %10
  %11 = load i32, ptr %x.addr, align 4
  %add10 = add i32 %11, -4
  %and11 = and i32 %and9, %add10
  %12 = load i32, ptr %result, align 4
  %or12 = or i32 %12, %and11
  store i32 %or12, ptr %result, align 4
  %13 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %13, 62
  %sub13 = sub i32 0, %xor
  %shr14 = lshr i32 %sub13, 8
  %not15 = xor i32 %shr14, -1
  %and16 = and i32 %not15, 45
  %14 = load i32, ptr %result, align 4
  %or17 = or i32 %14, %and16
  store i32 %or17, ptr %result, align 4
  %15 = load i32, ptr %x.addr, align 4
  %xor18 = xor i32 %15, 63
  %sub19 = sub i32 0, %xor18
  %shr20 = lshr i32 %sub19, 8
  %not21 = xor i32 %shr20, -1
  %and22 = and i32 %not21, 95
  %16 = load i32, ptr %result, align 4
  %or23 = or i32 %16, %and22
  store i32 %or23, ptr %result, align 4
  %17 = load i32, ptr %result, align 4
  %and24 = and i32 %17, 255
  ret i32 %and24
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
