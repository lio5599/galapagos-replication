; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_0.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_0.c"
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
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %cmp = icmp ult i32 %0, 26
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, ptr %x.addr, align 4
  %add = add i32 %1, 65
  store i32 %add, ptr %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %2 = load i32, ptr %x.addr, align 4
  %cmp1 = icmp ult i32 %2, 52
  br i1 %cmp1, label %if.then2, label %if.else4

if.then2:                                         ; preds = %if.else
  %3 = load i32, ptr %x.addr, align 4
  %add3 = add i32 %3, 71
  store i32 %add3, ptr %retval, align 4
  br label %return

if.else4:                                         ; preds = %if.else
  %4 = load i32, ptr %x.addr, align 4
  %cmp5 = icmp ult i32 %4, 62
  br i1 %cmp5, label %if.then6, label %if.else8

if.then6:                                         ; preds = %if.else4
  %5 = load i32, ptr %x.addr, align 4
  %add7 = add i32 %5, -4
  store i32 %add7, ptr %retval, align 4
  br label %return

if.else8:                                         ; preds = %if.else4
  %6 = load i32, ptr %x.addr, align 4
  %cmp9 = icmp eq i32 %6, 62
  br i1 %cmp9, label %if.then10, label %if.else11

if.then10:                                        ; preds = %if.else8
  store i32 45, ptr %retval, align 4
  br label %return

if.else11:                                        ; preds = %if.else8
  %7 = load i32, ptr %x.addr, align 4
  %cmp12 = icmp eq i32 %7, 63
  br i1 %cmp12, label %if.then13, label %if.end

if.then13:                                        ; preds = %if.else11
  store i32 95, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %if.else11
  br label %if.end14

if.end14:                                         ; preds = %if.end
  br label %if.end15

if.end15:                                         ; preds = %if.end14
  br label %if.end16

if.end16:                                         ; preds = %if.end15
  br label %if.end17

if.end17:                                         ; preds = %if.end16
  store i32 0, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end17, %if.then13, %if.then10, %if.then6, %if.then2, %if.then
  %8 = load i32, ptr %retval, align 4
  ret i32 %8
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
