; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r2/functions/libsodium/variants/c/0_b64_byte_to_char_4.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r2/functions/libsodium/variants/c/0_b64_byte_to_char_4.c"
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
  %result = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  %1 = load i32, ptr %x.addr, align 4
  %add = add i32 %1, 65
  %and = and i32 %shr, %add
  store i32 %and, ptr %result, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %2, 26
  %shr2 = lshr i32 %sub1, 8
  %not = xor i32 %shr2, -1
  %3 = load i32, ptr %x.addr, align 4
  %sub3 = sub i32 %3, 52
  %shr4 = lshr i32 %sub3, 8
  %and5 = and i32 %not, %shr4
  %4 = load i32, ptr %x.addr, align 4
  %add6 = add i32 %4, 71
  %and7 = and i32 %and5, %add6
  %5 = load i32, ptr %result, align 4
  %or = or i32 %5, %and7
  store i32 %or, ptr %result, align 4
  %6 = load i32, ptr %x.addr, align 4
  %sub8 = sub i32 %6, 52
  %shr9 = lshr i32 %sub8, 8
  %not10 = xor i32 %shr9, -1
  %7 = load i32, ptr %x.addr, align 4
  %sub11 = sub i32 %7, 62
  %shr12 = lshr i32 %sub11, 8
  %and13 = and i32 %not10, %shr12
  %8 = load i32, ptr %x.addr, align 4
  %add14 = add i32 %8, -4
  %and15 = and i32 %and13, %add14
  %9 = load i32, ptr %result, align 4
  %or16 = or i32 %9, %and15
  store i32 %or16, ptr %result, align 4
  %10 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %10, 62
  %sub17 = sub i32 0, %xor
  %shr18 = lshr i32 %sub17, 8
  %not19 = xor i32 %shr18, -1
  %and20 = and i32 %not19, 43
  %11 = load i32, ptr %result, align 4
  %or21 = or i32 %11, %and20
  store i32 %or21, ptr %result, align 4
  %12 = load i32, ptr %x.addr, align 4
  %xor22 = xor i32 %12, 63
  %sub23 = sub i32 0, %xor22
  %shr24 = lshr i32 %sub23, 8
  %not25 = xor i32 %shr24, -1
  %and26 = and i32 %not25, 47
  %13 = load i32, ptr %result, align 4
  %or27 = or i32 %13, %and26
  store i32 %or27, ptr %result, align 4
  %14 = load i32, ptr %result, align 4
  %and28 = and i32 %14, 255
  ret i32 %and28
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
