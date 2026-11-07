; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r2/functions/libsodium/variants/c/2_b64_char_to_byte_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r2/functions/libsodium/variants/c/2_b64_char_to_byte_8.c"
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
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %d = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %and = and i32 %sub, 255
  store i32 %and, ptr %a, align 4
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 %2, 71
  %and2 = and i32 %sub1, 255
  store i32 %and2, ptr %b, align 4
  %3 = load i32, ptr %u, align 4
  %sub3 = sub i32 %3, -4
  %and4 = and i32 %sub3, 255
  store i32 %and4, ptr %d, align 4
  %4 = load i32, ptr %a, align 4
  %5 = load i32, ptr %a, align 4
  %6 = load i32, ptr %u, align 4
  %sub5 = sub i32 %6, 65
  %7 = load i32, ptr %u, align 4
  %sub6 = sub i32 90, %7
  %or = or i32 %sub5, %sub6
  %shr = lshr i32 %or, 8
  %and7 = and i32 %5, %shr
  %xor = xor i32 %4, %and7
  %8 = load i32, ptr %b, align 4
  %9 = load i32, ptr %b, align 4
  %10 = load i32, ptr %u, align 4
  %sub8 = sub i32 %10, 97
  %11 = load i32, ptr %u, align 4
  %sub9 = sub i32 122, %11
  %or10 = or i32 %sub8, %sub9
  %shr11 = lshr i32 %or10, 8
  %and12 = and i32 %9, %shr11
  %xor13 = xor i32 %8, %and12
  %or14 = or i32 %xor, %xor13
  %12 = load i32, ptr %d, align 4
  %13 = load i32, ptr %d, align 4
  %14 = load i32, ptr %u, align 4
  %sub15 = sub i32 %14, 48
  %15 = load i32, ptr %u, align 4
  %sub16 = sub i32 57, %15
  %or17 = or i32 %sub15, %sub16
  %shr18 = lshr i32 %or17, 8
  %and19 = and i32 %13, %shr18
  %xor20 = xor i32 %12, %and19
  %or21 = or i32 %or14, %xor20
  %16 = load i32, ptr %u, align 4
  %xor22 = xor i32 %16, 43
  %sub23 = sub i32 0, %xor22
  %shr24 = lshr i32 %sub23, 8
  %and25 = and i32 62, %shr24
  %xor26 = xor i32 62, %and25
  %or27 = or i32 %or21, %xor26
  %17 = load i32, ptr %u, align 4
  %xor28 = xor i32 %17, 47
  %sub29 = sub i32 0, %xor28
  %shr30 = lshr i32 %sub29, 8
  %and31 = and i32 63, %shr30
  %xor32 = xor i32 63, %and31
  %or33 = or i32 %or27, %xor32
  store i32 %or33, ptr %x, align 4
  %18 = load i32, ptr %x, align 4
  %tobool = icmp ne i32 %18, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %19 = load i32, ptr %u, align 4
  %xor34 = xor i32 %19, 65
  %sub35 = sub i32 0, %xor34
  %shr36 = lshr i32 %sub35, 8
  %and37 = and i32 %shr36, 255
  store i32 %and37, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %20 = load i32, ptr %x, align 4
  store i32 %20, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %21 = load i32, ptr %retval, align 4
  ret i32 %21
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
