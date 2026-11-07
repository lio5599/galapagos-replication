; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r2/functions/libsodium/variants/c/2_b64_char_to_byte_7.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r2/functions/libsodium/variants/c/2_b64_char_to_byte_7.c"
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
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %d = alloca i32, align 4
  %p = alloca i32, align 4
  %q = alloca i32, align 4
  %x = alloca i32, align 4
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
  store i32 %and, ptr %a, align 4
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
  store i32 %and9, ptr %b, align 4
  %7 = load i32, ptr %u, align 4
  %sub10 = sub i32 %7, 48
  %8 = load i32, ptr %u, align 4
  %sub11 = sub i32 57, %8
  %or12 = or i32 %sub10, %sub11
  %not13 = xor i32 %or12, -1
  %shr14 = lshr i32 %not13, 8
  %9 = load i32, ptr %u, align 4
  %sub15 = sub i32 %9, 48
  %add16 = add i32 %sub15, 52
  %and17 = and i32 %shr14, %add16
  store i32 %and17, ptr %d, align 4
  %10 = load i32, ptr %u, align 4
  %xor = xor i32 %10, 43
  %sub18 = sub i32 0, %xor
  %not19 = xor i32 %sub18, -1
  %shr20 = lshr i32 %not19, 8
  %and21 = and i32 %shr20, 62
  store i32 %and21, ptr %p, align 4
  %11 = load i32, ptr %u, align 4
  %xor22 = xor i32 %11, 47
  %sub23 = sub i32 0, %xor22
  %not24 = xor i32 %sub23, -1
  %shr25 = lshr i32 %not24, 8
  %and26 = and i32 %shr25, 63
  store i32 %and26, ptr %q, align 4
  %12 = load i32, ptr %a, align 4
  %13 = load i32, ptr %b, align 4
  %or27 = or i32 %12, %13
  %14 = load i32, ptr %d, align 4
  %or28 = or i32 %or27, %14
  %15 = load i32, ptr %p, align 4
  %or29 = or i32 %or28, %15
  %16 = load i32, ptr %q, align 4
  %or30 = or i32 %or29, %16
  %and31 = and i32 %or30, 255
  store i32 %and31, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %18 = load i32, ptr %x, align 4
  %sub32 = sub i32 0, %18
  %not33 = xor i32 %sub32, -1
  %shr34 = lshr i32 %not33, 8
  %19 = load i32, ptr %u, align 4
  %xor35 = xor i32 %19, 65
  %sub36 = sub i32 0, %xor35
  %shr37 = lshr i32 %sub36, 8
  %and38 = and i32 %shr34, %shr37
  %and39 = and i32 %and38, 255
  %or40 = or i32 %17, %and39
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
