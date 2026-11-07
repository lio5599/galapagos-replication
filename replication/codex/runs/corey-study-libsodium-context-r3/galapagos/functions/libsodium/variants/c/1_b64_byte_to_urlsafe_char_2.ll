; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r3/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_2.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r3/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_2.c"
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
  %upper = alloca i32, align 4
  %lower = alloca i32, align 4
  %digit = alloca i32, align 4
  %dash = alloca i32, align 4
  %underscore = alloca i32, align 4
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
  %3 = load i32, ptr %x.addr, align 4
  %add = add i32 %3, 65
  %and7 = and i32 %add, 255
  store i32 %and7, ptr %upper, align 4
  %4 = load i32, ptr %x.addr, align 4
  %add8 = add i32 %4, 71
  %and9 = and i32 %add8, 255
  store i32 %and9, ptr %lower, align 4
  %5 = load i32, ptr %x.addr, align 4
  %add10 = add i32 %5, -4
  %and11 = and i32 %add10, 255
  store i32 %and11, ptr %digit, align 4
  %6 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %6, 62
  %sub12 = sub i32 0, %xor
  %shr13 = lshr i32 %sub12, 8
  %not = xor i32 %shr13, -1
  %and14 = and i32 %not, 255
  store i32 %and14, ptr %dash, align 4
  %7 = load i32, ptr %x.addr, align 4
  %xor15 = xor i32 %7, 63
  %sub16 = sub i32 0, %xor15
  %shr17 = lshr i32 %sub16, 8
  %not18 = xor i32 %shr17, -1
  %and19 = and i32 %not18, 255
  store i32 %and19, ptr %underscore, align 4
  %8 = load i32, ptr %a, align 4
  %9 = load i32, ptr %upper, align 4
  %and20 = and i32 %8, %9
  %10 = load i32, ptr %a, align 4
  %not21 = xor i32 %10, -1
  %11 = load i32, ptr %b, align 4
  %and22 = and i32 %not21, %11
  %12 = load i32, ptr %lower, align 4
  %and23 = and i32 %and22, %12
  %or = or i32 %and20, %and23
  %13 = load i32, ptr %b, align 4
  %not24 = xor i32 %13, -1
  %14 = load i32, ptr %c, align 4
  %and25 = and i32 %not24, %14
  %15 = load i32, ptr %digit, align 4
  %and26 = and i32 %and25, %15
  %or27 = or i32 %or, %and26
  %16 = load i32, ptr %dash, align 4
  %and28 = and i32 %16, 45
  %or29 = or i32 %or27, %and28
  %17 = load i32, ptr %underscore, align 4
  %and30 = and i32 %17, 95
  %or31 = or i32 %or29, %and30
  ret i32 %or31
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
