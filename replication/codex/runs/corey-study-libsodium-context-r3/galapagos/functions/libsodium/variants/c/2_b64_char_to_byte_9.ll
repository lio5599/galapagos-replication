; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r3/functions/libsodium/variants/c/2_b64_char_to_byte_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r3/functions/libsodium/variants/c/2_b64_char_to_byte_9.c"
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
  %upper = alloca i32, align 4
  %lower = alloca i32, align 4
  %digit = alloca i32, align 4
  %plus = alloca i32, align 4
  %slash = alloca i32, align 4
  %x = alloca i32, align 4
  %fallback = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %or = or i32 %sub, %sub1
  %shr = lshr i32 %or, 8
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 65
  %not = xor i32 %sub2, -1
  %or3 = or i32 %shr, %not
  %not4 = xor i32 %or3, -1
  store i32 %not4, ptr %upper, align 4
  %4 = load i32, ptr %u, align 4
  %sub5 = sub i32 %4, 97
  %5 = load i32, ptr %u, align 4
  %sub6 = sub i32 122, %5
  %or7 = or i32 %sub5, %sub6
  %shr8 = lshr i32 %or7, 8
  %6 = load i32, ptr %u, align 4
  %sub9 = sub i32 %6, 71
  %not10 = xor i32 %sub9, -1
  %or11 = or i32 %shr8, %not10
  %not12 = xor i32 %or11, -1
  store i32 %not12, ptr %lower, align 4
  %7 = load i32, ptr %u, align 4
  %sub13 = sub i32 %7, 48
  %8 = load i32, ptr %u, align 4
  %sub14 = sub i32 57, %8
  %or15 = or i32 %sub13, %sub14
  %shr16 = lshr i32 %or15, 8
  %9 = load i32, ptr %u, align 4
  %sub17 = sub i32 %9, -4
  %not18 = xor i32 %sub17, -1
  %or19 = or i32 %shr16, %not18
  %not20 = xor i32 %or19, -1
  store i32 %not20, ptr %digit, align 4
  %10 = load i32, ptr %u, align 4
  %xor = xor i32 %10, 43
  %sub21 = sub i32 0, %xor
  %shr22 = lshr i32 %sub21, 8
  %or23 = or i32 %shr22, -63
  %not24 = xor i32 %or23, -1
  store i32 %not24, ptr %plus, align 4
  %11 = load i32, ptr %u, align 4
  %xor25 = xor i32 %11, 47
  %sub26 = sub i32 0, %xor25
  %shr27 = lshr i32 %sub26, 8
  %or28 = or i32 %shr27, -64
  %not29 = xor i32 %or28, -1
  store i32 %not29, ptr %slash, align 4
  %12 = load i32, ptr %upper, align 4
  %13 = load i32, ptr %lower, align 4
  %or30 = or i32 %12, %13
  %14 = load i32, ptr %digit, align 4
  %or31 = or i32 %or30, %14
  %15 = load i32, ptr %plus, align 4
  %or32 = or i32 %or31, %15
  %16 = load i32, ptr %slash, align 4
  %or33 = or i32 %or32, %16
  %and = and i32 %or33, 255
  store i32 %and, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %sub34 = sub i32 0, %17
  %shr35 = lshr i32 %sub34, 8
  %18 = load i32, ptr %u, align 4
  %xor36 = xor i32 %18, 65
  %sub37 = sub i32 0, %xor36
  %shr38 = lshr i32 %sub37, 8
  %not39 = xor i32 %shr38, -1
  %or40 = or i32 %shr35, %not39
  %not41 = xor i32 %or40, -1
  %and42 = and i32 %not41, 255
  store i32 %and42, ptr %fallback, align 4
  %19 = load i32, ptr %x, align 4
  %20 = load i32, ptr %fallback, align 4
  %or43 = or i32 %19, %20
  ret i32 %or43
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
